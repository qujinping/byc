# !/bin/bash


BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc process -f $TEMPLATES/nodejsbc_templ.yaml -p APP_NAME=front-end -p APP_SOURCE_REPOSITORY_URL=https://github.com/qujinping/front-end -p APP_BUILDER_IMAGE=builder-nodejs-4-centos7:latest | oc create -f -
