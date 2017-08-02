# !/bin/bash


BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc process -f $TEMPLATES/pythonbc_templ.yaml -p APP_NAME=load-test -p APP_SOURCE_REPOSITORY_URL=https://github.com/qujinping/load-test -p APP_BUILDER_IMAGE=builder-python-27-centos7:latest | oc create -f -
