# !/bin/bash

BASE="`pwd`/`dirname $0`/.."
TEMPLATES=$BASE/common

oc process -f $TEMPLATES/dockerbc_httpsproxy_templ.yaml -p APP_NAME=s2i-did -p APP_SOURCE_REPOSITORY_URL=https://github.com/qujinping/s2i-did -p APP_SOURCE_CONTEXT_DIR=. -p FROM_IMAGE_STREAM_NAME="centos:latest" -p FROM_IMAGE_STREAM_NAMESPACE="core"| oc create -f -
