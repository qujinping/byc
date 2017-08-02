openshift project administration

https://docs.openshift.org/latest/admin_guide/managing_projects.html#modifying-the-template-for-new-projects

1)关闭用户new project 的权限
oadm policy remove-cluster-role-from-group self-provisioner system:authenticated system:authenticated:oauth

配置 projectRequestMessage 参数 in the master-config.yaml 

2）对project core/mid/common，
赋予权限

3) 生成project template
1. Start with the current default project template: $ oadm create-bootstrap-project-template -o yaml > template.yaml
2. Use a text editor to modify the template.yaml file by adding objects or modifying existing objects.
3. 由于 在openshift/origin 3.5已经修复的 template processing的一个bug（https://github.com/openshift/origin/issues/3840 & https://github.com/openshift/origin/pull/12918），我们需要手工把所有object的namespace改好

oc process -f whole/app_proj_templete.yaml -v PROJECT_NAME=sock -v PROJECT_ADMIN_USER=developer |  sed s/namespace\":\ \"/namespace\":\ \”sock/g |oc create -f  -

oc process -f whole/app_proj_test_templete.yaml -v PROJECT_NAME=sock  -v PROJECT_ADMIN_USER=developer |  sed s/namespace\":\ \"/namespace\":\ \”sock-test/g |oc create -f  -


4) launch jenkins in project <foo> 
https://docs.openshift.org/latest/using_images/other_images/jenkins.html
oc new-app jenkins-ephemeral -p JENKINS_IMAGE_STREAM_TAG=jenkins-2-centos7:latest -p MEMORY_LIMIT=1Gi -p NAMESPACE=core
或者
https://github.com/openshift/origin/blob/master/examples/jenkins/jenkins-persistent-template.json
