# !/bin/bash

oc process template/jenkins-persistent -n openshift -p NAMESPACE=tools -p JENKINS_IMAGE_STREAM_TAG=jenkins-2-centos7:latest -p MEMORY_LIMIT=1024Mi | oc create -f - 

oc create --save-config -f jenkinscfg.yaml
oc create --save-config -f int-test.yaml

