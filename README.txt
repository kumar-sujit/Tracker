


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
***********************************************************************************************************************************************
script:

#!/bin/bash
filename=${MicroServiceName}
declare -l filename
filename=${filename}
credential=$1
git clone https://${credential}@codehub.optum.com/rollback-demo/${filename}.git
cd ${filename}
Git_Tag_Commit=`git rev-list --tags --max-count=1`
Git_Latest_Tag=`git describe --tags $Git_Tag_Commit`
echo $Git_Latest_Tag
cd ..
rm -rf ${filename}
echo "MicroService Name:"${filename} > ${filename}.txt
echo "Version:" $Version >> ${filename}.txt
echo "Branch Name :"$BranchName >> ${filename}.txt
echo "Build Number:"$BuildNumber >> ${filename}.txt
echo "Commit ID :"$CommitId >> ${filename}.txt
echo "Stage Completion Tag :" $Git_Latest_Tag >> ${filename}.txt
awk -F: 'BEGIN {print "{"}{print "\"" $1"\":" " \""$2"\","}END{print "}"}' ${filename}.txt > ${filename}.json
rm ${filename}.txt
git init
git remote add origin https://${credential}@codehub.optum.com/rollback-demo/trackerrepo.git
git add .
git commit -m "$GIT_AUTHOR made a few changes for this ${filename}"
git fetch origin master
git merge -s recursive -Xours origin/master
git push origin master

parameters to child job:

Parameters
 	MicroServiceName		
		
 	BranchName		
		
 	CommitId		
		
 	BuildNumber		
		
 	Version		
		
 	GIT_TAG		
		
execute shell:
git clone https://${credentials}@codehub.optum.com/rollback-demo/trackerrepo.git
cd trackerrepo
chmod +x tracker/tracker.sh
./tracker/tracker.sh ${credentials}
