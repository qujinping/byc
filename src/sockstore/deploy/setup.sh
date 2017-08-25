# !/bin/bash

set -eo pipefail

# create config map
oc create configmap edge-router --from-file=traefik.toml

# create deployment config & service
for file in ./*-service.yaml
do
    oc create -f $file
done

for file in ./*-deploymentconfig.yaml
do
    oc create -f $file
done

# Create image stream
# if you use different docker registry in the cluster for remote deployment, do below
oc create -f is_remote.yaml
# Otherwise, uncomment out below
# oc create -f is_local.yaml
