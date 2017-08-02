# !/bin/bash

set -eo pipefail

BASE="`pwd`/`dirname $0`/.."

PROJECT_NAME=$1-prod
PROJECT_ADMIN_USER=$2
PROJECT_TEMPLETE_DIR=$BASE/project-template

oc process -f $PROJECT_TEMPLETE_DIR/app_proj_prod_templete.yaml -p PROJECT_NAME=$PROJECT_NAME -p PROJECT_ADMIN_USER=$PROJECT_ADMIN_USER 
