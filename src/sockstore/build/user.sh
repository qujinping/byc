# !/bin/bash


BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc process -f $TEMPLATES/gobc_templ.yaml -p APP_NAME=user -p APP_SOURCE_REPOSITORY_URL=https://github.com/qujinping/user -p APP_BUILDER_IMAGE=builder-go-16-centos7:latest | oc create -f -
