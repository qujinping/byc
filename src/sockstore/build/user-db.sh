# !/bin/bash


BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc process -f $TEMPLATES/dockerbc_templ.yaml -p APP_NAME=user-db -p APP_SOURCE_REPOSITORY_URL=https://github.com/qujinping/user -p APP_SOURCE_CONTEXT_DIR=docker/user-db/ | oc create -f -
