# !/bin/bash

oc process openshift/template/jenkins-persistent -p NAMESPACE=tools -p JENKINS_IMAGE_STREAM_TAG=jenkins-2-centos7:latest -p VOLUME_CAPACITY=2Gi -p MEMORY_LIMIT=1024Mi | oc create -f - 

oc create --save-config -f jenkinscfg.yaml
oc create --save-config -f int-test.yaml
oc create --save-config -f remote-deploy.yaml

