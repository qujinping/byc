# !/bin/bash

# proj core
oadm policy add-role-to-user system:image-puller system:anonymous -n core
oadm policy add-role-to-group system:image-puller system:authenticated system:authenticated:oauth -n core
