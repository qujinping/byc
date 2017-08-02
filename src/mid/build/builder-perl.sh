# !/bin/bash

BASE="`pwd`/`dirname $0`/.."
TEMPLATES=$BASE/common

NAMESPACE="mid/"
BASE_IMAGE_NAME="builder-perl"
VERSION="4"
VERSION_STR=${VERSION//./}
OS=centos7
SOURCE_REPOSITORY="https://github.com/qujinping/s2i-perl-container.git"

oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="5.20" -p VERSION_STR="520" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
oc process -f $TEMPLATES/custombc_templ.yaml -p NAMESPACE=${NAMESPACE} -p BASE_IMAGE_NAME=${BASE_IMAGE_NAME} -p VERSION="5.24" -p VERSION_STR="524" -p OS=${OS} -p SOURCE_REPOSITORY=${SOURCE_REPOSITORY} | oc create -f -
