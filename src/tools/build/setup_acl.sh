# !/bin/bash

# proj core
oadm policy add-role-to-group system:image-puller system:authenticated system:unauthenticated -n tools
