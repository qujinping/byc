# !/bin/bash

BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc process -f $TEMPLATES/bc_own_builder_templ.yaml -p APP_NAME=skopeo -p APP_SOURCE_REPOSITORY_URL="https://github.com/qujinping/skopeo" -p APP_SOURCE_CONTEXT_DIR=. -p APP_BUILDER_DOCKERFILE="Dockerfile.builder" -p APP_BUILDER_FROM_IMAGE_STREAM_NAME="builder-go-17-centos7:latest" -p APP_BUILDER_FROM_IMAGE_STREAM_NAMESPACE="mid" | oc create -f -
