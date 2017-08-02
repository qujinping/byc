# !/bin/bash

# proj mid
oadm policy add-role-to-user system:image-puller system:anonymous -n mid
oadm policy add-role-to-group system:image-puller system:authenticated system:authenticated:oauth -n mid

# proj common
#oc adm policy add-role-to-user system:image-puller system:anonymous -n common
#oc adm policy add-role-to-group system:image-puller system:authenticated system:authenticated:oauth -n common
