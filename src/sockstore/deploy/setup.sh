# !/bin/bash

set -eo pipefail

# create config map
oc create configmap edge-router --from-file=traefik.toml

# create deployment config & service
ls *-service.yaml |awk '{print "\"" "oc create -f " $1 "\""}' |xargs sh -c
ls *-deploymentconfig.yaml |awk '{print "\"" "oc create -f " $1 "\""}' |xargs sh -c

# Create image stream
# if you use different docker registry in the cluster for remote deployment, do below
oc create -f is_remote.yaml
# Otherwise, uncomment out below
# oc create -f is_local.yaml
