# !/bin/bash

BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc process -f $TEMPLATES/dockerbc_templ.yaml -p APP_NAME=catalogue-db -p APP_SOURCE_REPOSITORY_URL=https://github.com/qujinping/catalogue -p APP_SOURCE_CONTEXT_DIR=docker/catalogue-db/ | oc create -f -
