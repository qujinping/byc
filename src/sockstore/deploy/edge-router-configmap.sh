# !/bin/bash

BASE="`pwd`/`dirname $0`/"

oc create configmap edge-router --from-file=$BASE/traefik.toml
