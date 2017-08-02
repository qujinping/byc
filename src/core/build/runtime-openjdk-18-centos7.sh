# !/bin/bash

BASE="`pwd`/`dirname $0`/.."
TEMPLATES=$BASE/common

oc process -f $TEMPLATES/dockerbc_templ.yaml -p APP_NAME=runtime-openjdk-18-centos7 -p APP_SOURCE_REPOSITORY_URL=https://github.com/qujinping/runtime-java-container -p APP_SOURCE_CONTEXT_DIR=. -p FROM_IMAGE_STREAM_NAME="runtime-base-centos7:latest" -p FROM_IMAGE_STREAM_NAMESPACE="core"| oc create -f -
