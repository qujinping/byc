# !/bin/bash

oc import-image jenkins-2-centos7:latest --from=openshift/jenkins-2-centos7:latest --confirm
oc import-image jenkins-slave-maven-centos7:latest --from=openshift/jenkins-slave-maven-centos7:latest --confirm
oc import-image jenkins-slave-base-centos7:latest --from=openshift/jenkins-slave-base-centos7:latest --confirm
