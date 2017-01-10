
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
*********************************************************************************************************************
*********************************************************************************************************************
