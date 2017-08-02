# !/bin/bash

BASE="`pwd`/`dirname $0`/.."
TEMPLATES=$BASE/common

NAMESPACE="mid/"
BASE_IMAGE_NAME="builder-python"
VERSION="4"
VERSION_STR=${VERSION//./}
OS=centos7
SOURCE_REPOSITORY="https://github.com/qujinping/s2i-python-container.git"

oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="2.7" -p VERSION_STR="27" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="3.4" -p VERSION_STR="34" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="3.5" -p VERSION_STR="35" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
