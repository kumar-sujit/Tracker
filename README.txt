ose_domain="ose-ctc-dmz.optum.com"
ose_user="propel_stage"
ose_pass="${propel_stage}"

app_name="provider-auto-update"
#tmp_app_name="api"
deploy_project="propel-stg"

if [ $ROLLBACK = "YES] ; then
app_name="provider-auto-update-$version"
git_tag=`git tag | tail -1`
fi

export PATH=$PATH:/tools/oc/oc-${OC_VERSION}/oc
echo "Logging in to ${ose_domain} as ${ose_user}"
oc login https://${ose_domain} --insecure-skip-tls-verify=true -u ${ose_user} -p ${ose_pass}
echo "Changing project to ${deploy_project}"
oc project ${deploy_project}
echo "Triggering s2i build of pipeline's git commit"
oc start-build ${app_name} --commit=$GIT_COMMIT

timestamp="$(date +"%Y-%m-%d_%H-%M-%S")"

#set env var to be used in git publisher
echo TIMESTAMP=$timestamp > propsfile


*********************************************************************************************************************
*********************************************************************************************************************
