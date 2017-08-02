# !/bin/bash

BASE="`pwd`/`dirname $0`/.."
TEMPLATES=$BASE/common

oc process -f $TEMPLATES/builder-base-container_tmpl.yaml -p NAMESPACE="core/" -p BASE_IMAGE_NAME="builder-base" -p OS=centos7 -p SOURCE_REPOSITORY="https://github.com/qujinping/s2i-base-container.git" | oc create -f -
