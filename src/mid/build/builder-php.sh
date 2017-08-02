# !/bin/bash

BASE="`pwd`/`dirname $0`/.."
TEMPLATES=$BASE/common

NAMESPACE="mid/"
BASE_IMAGE_NAME="builder-php"
VERSION="4"
VERSION_STR=${VERSION//./}
OS=centos7
SOURCE_REPOSITORY="https://github.com/qujinping/s2i-php-container.git"

oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="5.6" -p VERSION_STR="56" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="7.0" -p VERSION_STR="70" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
