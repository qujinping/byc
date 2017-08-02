# !/bin/bash

#oc import-image runtime-base-centos7:latest --from=centos:centos7.3.1611 --confirm
oc import-image centos:7 --from=centos:centos7 --confirm
oc tag centos:7 centos:latest
