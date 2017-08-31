# !/bin/bash

set -eo pipefail

BASE="`pwd`/`dirname $0`/.."

function usage() 
{
    echo "Usage: docker_volume_setup [OPTION]"
    echo "To make docker volumes directory mutable/immutable"
    echo "  -i, --inventory=FILE       obtain openshift node name list from FILE"
    echo "  -m, --mutable=true         make /var/lib/docker/volumes mutable/immutable"
}

if [[ $# -lt 1 ]]; then
    usage
    exit 1
fi

INVENTORY_FILE=""
MUTABLE="false"
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
    -m=* | --mutable=*)
    MUTABLE="${i#*=}"
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


SYSTEMD_UNIT_FILE="/usr/lib/systemd/system/docker.service"
EXEC_START_PRE="ExecStartPre=/bin/bash -c '/usr/bin/test -d /var/lib/docker/volumes && /usr/bin/chattr -i /var/lib/docker/volumes ; true'"
EXEC_START_POST="ExecStartPost=/bin/bash -c '/usr/bin/test -d /var/lib/docker/volumes && /usr/bin/chattr +i /var/lib/docker/volumes ; true'"

NODES=`sed -n '/\[nodes\]/,/\[.*\]/p' $INVENTORY_FILE |grep -v '\[nodes\]' |awk '{print $1}'`
for NODE in $NODES 
do
  echo
  echo "======= Node: $NODE ========"
  ssh $NODE "
    if [[ $MUTABLE == "true" ]]
    then
        echo make directory "/var/lib/docker/volumes" mutable 
        grep -qF "\""$EXEC_START_PRE"\""  $SYSTEMD_UNIT_FILE  || sed -i -e "\""/ExecReload/a$EXEC_START_PRE"\"" $SYSTEMD_UNIT_FILE
        sed -i -e "\"/chattr +i/d\"" $SYSTEMD_UNIT_FILE
    else
        echo make directory "/var/lib/docker/volumes" immutable to avoid garbage genereted by "volume" defined in dockerfile
        grep -qF "\""$EXEC_START_PRE"\""  $SYSTEMD_UNIT_FILE  || sed -i -e "\""/ExecReload/a$EXEC_START_PRE"\"" $SYSTEMD_UNIT_FILE
        grep -qF "\""$EXEC_START_POST"\"" $SYSTEMD_UNIT_FILE  || sed -i -e "\""/ExecReload/a$EXEC_START_POST"\"" $SYSTEMD_UNIT_FILE
    fi
  "
done
