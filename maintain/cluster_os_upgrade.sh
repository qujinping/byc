# !/bin/bash

set -eo pipefail

BASE="`pwd`/`dirname $0`/.."

function usage() 
{
    echo "Usage: cluster_os_upgrade.sh [OPTION]"
    echo "To Update or upgrade your operating system (OS), by either changing OS versions or updating the system software"
    echo "  -i, --inventory=FILE       obtain openshift node name list from FILE"
    echo "  -d, --dryrun=true          just dryrun upgradtion to understand what to be done"
}

if [[ $# -lt 1 ]]; then
    usage
    exit 1
fi

INVENTORY_FILE=""
DRYRUN="false"
for i in "$@"
do
case $i in
    -h | --help)
    usage
    exit 0
    ;;
    -i=* | --inventory=*)
    INVENTORY_FILE="${i#*=}"
    shift 
    ;;
    -d=* | --dryrun=*)
    DRYRUN="${i#*=}"
    shift
    ;;
    *)
    # unknown option
    echo "Error: unkonw option: $i"
    echo ""
    usage
    exit 1
    ;;
esac
done

if [[ -z "$INVENTORY_FILE" ]]
then
    echo "Error: you don't specify inventory file"
    echo ""
    usage
    exit 1
fi

OC_ACCOUNT=`oc whoami`
if [[ "$OC_ACCOUNT" != "admin" ]]
then
   echo "You're requied to logged in as admin!!!"
   exit 1
fi

NODES=`sed -n '/\[nodes\]/,/\[.*\]/p' $INVENTORY_FILE |grep -v '\[nodes\]' |awk '{print $1}'`
for NODE in $NODES 
do
  echo ""
  echo "======= Node: $NODE ========"

  if [[ $DRYRUN == "true" ]]
  then
    # do nothing for dry run
    echo "Dry run of OS upgrade for node $NODE, nothing will be done"
  else
    echo "OS upgrade for node $NODE is ongoing ..."
    echo "Step 1: make the node not schedulable"
    oadm manage-node $NODE --schedulable=false
    echo "Step 2: drain out those pods running in the node"
    oadm drain $NODE --force --delete-local-data --ignore-daemonsets
  fi

  ssh $NODE "
    if [[ $DRYRUN == "true" ]]
    then
        echo "In node $NODE, check what packages to be updated"
        yum makecache fast
        yum update --assumeno ; true
    else
        echo "Step 3: update OS kernel and system software if any latest version found"
        yum makecache fast
        yum update -y
        echo "Step 4: reboot OS"
        reboot
    fi
  " || true

  if [[ $DRYRUN == "true" ]]
  then
     # do nothing for dryrun
     echo "Dryrun for node $NODE is done!"
  else
     echo "Step 5: wait for node $NODE to be ready "
     sleep 30
     while ! ping -c1 $NODE &>/dev/null
     do 
       sleep 10
     done
     echo "Node $NODE is reachable"

     while ! oc status &>/dev/null
     do 
       sleep 10
     done
     echo "Cluster is reachable"

     NODE_STATUS="notready"
     while [ "$NODE_STATUS" != "Ready" ]
     do
       #sleep 30 second to check if the node is ready
       NODE_STATUS=`oc get nodes |grep $NODE |awk '{print $2}' |awk -F, '{print $1}'`
       sleep 10
     done
     echo "Status of $NODE is $NODE_STATUS"
     echo "Step 6: make the node schedulable"
     oadm manage-node $NODE --schedulable=true
     echo "Upgrade for node $NODE is done!"
  fi
done
