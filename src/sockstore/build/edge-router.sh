# !/bin/bash

BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc process -f $TEMPLATES/dockerbc_templ.yaml -p APP_NAME=edge-router -p APP_SOURCE_REPOSITORY_URL=https://github.com/qujinping/edge-router -p APP_SOURCE_CONTEXT_DIR=./ | oc create -f -
