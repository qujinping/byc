# !/bin/bash

BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc process -f $TEMPLATES/javabc_templ.yaml -p APP_NAME=cart -p APP_SOURCE_REPOSITORY_URL=https://github.com/qujinping/carts -p APP_BUILDER_IMAGE=builder-openjdk-18-centos7:latest | oc create -f -
