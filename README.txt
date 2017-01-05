ose_domain="ose-ctc-dmz.optum.com"
ose_user="propel_stage"
ose_pass="${propel_stage}"

app_name="provider-auto-update"
#tmp_app_name="api"
deploy_project="propel-stg"

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


[bugzilla] $ /bin/sh -xe /tmp/hudson107299014572097767.sh
channel stopped
+ timestamp=0.9.3-SNAPSHOT-RELEASE
+ echo 703dcaacb7137c0ef946a0579d34a260e604edd4
703dcaacb7137c0ef946a0579d34a260e604edd4
+ [ YES != NO ]
+ wget https://github.com/kumar-sujit/Tracker/raw/Stage/tracker.json
--2017-01-06 02:26:59--  https://github.com/kumar-sujit/Tracker/raw/Stage/tracker.json
Resolving github.com (github.com)... 192.30.253.113, 192.30.253.112
Connecting to github.com (github.com)|192.30.253.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://raw.githubusercontent.com/kumar-sujit/Tracker/Stage/tracker.json [following]
--2017-01-06 02:27:05--  https://raw.githubusercontent.com/kumar-sujit/Tracker/Stage/tracker.json
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.192.133, 151.101.128.133, 151.101.64.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.192.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 202 [text/plain]
Saving to: ‘tracker.json’

     0K                                                       100% 42.0M=0s

2017-01-06 02:27:06 (42.0 MB/s) - ‘tracker.json’ saved [202/202]

+ awk -F" {print $(NF-1)}
+ grep Commit ID tracker.json
+ GIT_COMMIT= c1416317da45698d07c3b2b8b4f639002d1cc38d
+ echo c1416317da45698d07c3b2b8b4f639002d1cc38d
c1416317da45698d07c3b2b8b4f639002d1cc38d
Warning: you have no plugins providing access control for builds, so falling back to legacy behavior of permitting any downstream builds to be triggered
[parameterized-trigger] no SubversionTagAction found -- is this project an SVN project ?
Triggering a new build of Dev » childjob
Finished: SUCCESS
