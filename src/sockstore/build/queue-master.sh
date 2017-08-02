# !/bin/bash


BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc process -f $TEMPLATES/javabc_templ.yaml -p APP_NAME=queue-master -p APP_SOURCE_REPOSITORY_URL=https://github.com/qujinping/queue-master -p APP_BUILDER_IMAGE=builder-openjdk-18-centos7:latest | oc create -f -
