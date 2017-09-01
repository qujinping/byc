# !/bin/bash

set -eo pipefail

BASE="`pwd`/`dirname $0`/.."

function usage() 
{
    echo "Usage: fanout_exec [OPTION]"
    echo "To fan out command to be executed cluster-wise"
    echo "  -i, --inventory=FILE       obtain openshift node name list from FILE"
    echo "  -c, --command="cmd"        specify the command to be run"
}

if [[ $# -lt 1 ]]; then
    usage
    exit 1
fi

INVENTORY_FILE=""
EXEC_COMMAND=""
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
    -c=* | --command=*)
    EXEC_COMMAND="${i#*=}"
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

NODES=`sed -n '/\[nodes\]/,/\[.*\]/p' $INVENTORY_FILE |grep -v '\[nodes\]' |awk '{print $1}'`
for NODE in $NODES 
do
  echo
  echo "======= Node: $NODE ========"
  ssh $NODE "
    $EXEC_COMMAND
  "
done
