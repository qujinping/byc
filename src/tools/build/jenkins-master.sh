# !/bin/bash

BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc process -f $TEMPLATES/jenkins-master.yaml | oc create -f -
