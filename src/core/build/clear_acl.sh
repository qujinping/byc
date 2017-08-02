# !/bin/bash

# proj core
oadm policy remove-cluster-role-from-user system:image-puller system:anonymous -n core
oadm policy remove-cluster-role-from-group system:image-puller system:authenticated -n core
oadm policy remove-cluster-role-from-group system:image-puller system:authenticated:oauth -n core

