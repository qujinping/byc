# !/bin/bash

BASE="`pwd`/`dirname $0`/.."
TEMPLATES=$BASE/common

NAMESPACE="mid/"
BASE_IMAGE_NAME="builder-ruby"
VERSION="4"
VERSION_STR=${VERSION//./}
OS=centos7
SOURCE_REPOSITORY="https://github.com/qujinping/s2i-ruby-container.git"

oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="2.2" -p VERSION_STR="22" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="2.3" -p VERSION_STR="23" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
