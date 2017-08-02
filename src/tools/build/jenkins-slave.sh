# !/bin/bash

BASE="`pwd`/`dirname $0`/"
TEMPLATES=$BASE

oc create -f $TEMPLATES/jenkins-slave.yaml
