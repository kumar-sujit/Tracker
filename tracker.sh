rm -rf Tracker
git clone -b Dev --single-branch https://${credentials}@github.com/kumar-sujit/Tracker.git
cd Tracker
echo "MicroService Name" : "$JOB_BASE_NAME" > $JOB_BASE_NAME-$POM_VERSION.txt
echo "Branch Name" : "$BRANCH_NAME" >> $JOB_BASE_NAME-$POM_VERSION.txt
echo "Build Number : "$BUILD_NUMBER >> $JOB_BASE_NAME-$POM_VERSION.txt
awk -F: 'BEGIN {print "{" }{print "\"" $1"\":" " \""$2"\","}END{print "}"}' $JOB_BASE_NAME-$POM_VERSION.txt > $JOB_BASE_NAME-$POM_VERSION.json
git add --all
git config user.email "sujit@addteq.com"
git config user.name "sujitkumar"
git commit -am "$GIT_AUTHOR has made a new change for this $JOB_NAME-$POM_VERSION"
#set +x
#git pull https://${credentials}@github.com/kumar-sujit/Tracker.git Dev
git push https://${credentials}@github.com/kumar-sujit/Tracker.git Dev
