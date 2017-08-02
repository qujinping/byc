# !/bin/bash

BASE="`pwd`/`dirname $0`/.."
TEMPLATES=$BASE/common

NAMESPACE="mid/"
BASE_IMAGE_NAME="builder-go"
VERSION="1.6"
VERSION_STR=${VERSION//./}
OS=centos7
SOURCE_REPOSITORY="https://github.com/qujinping/s2i-go.git"

oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="1.4" -p VERSION_STR="14" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="1.5" -p VERSION_STR="15" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="1.6" -p VERSION_STR="16" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="1.7" -p VERSION_STR="17" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
