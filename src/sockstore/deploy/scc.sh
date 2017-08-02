# !/bin/bash

BASE="`pwd`/`dirname $0`/"

oc create -f $BASE/scc_xiaomi.yaml
oc adm policy add-scc-to-group xiaomi system:serviceaccounts:sockstore-prod
