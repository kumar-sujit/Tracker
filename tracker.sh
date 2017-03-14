Git_Tag_Commit=git rev-list --tags --max-count=1
Git_Latest_Tag=`git describe --tags $Git_Tag_Commit`
GIT_URL=`git config --get remote.tracker.url`
cd /home/addteq/prabhu_test1
pwd
echo $JOB_BASE_NAME
echo "MicroService Name" : "$JOB_BASE_NAME" > $JOB_BASE_NAME-$POM_VERSION.txt
echo "Branch Name" : "$GIT_BRANCH" >> $JOB_BASE_NAME-$POM_VERSION.txt
echo "Build Number : "$BUILD_NUMBER >> $JOB_BASE_NAME-$POM_VERSION.txt
echo "Commit ID : "$GIT_COMMIT >> $JOB_BASE_NAME-$POM_VERSION.txt
echo "Date : " `date +"%c"` >> $JOB_BASE_NAME-$POM_VERSION.txt
echo "Git URL : " "$GIT_URL" >> $JOB_BASE_NAME-$POM_VERSION.txt
echo "Build Tag : " $Git_Latest_Tag >> $JOB_BASE_NAME-$POM_VERSION.txt
echo "Change Author : "$CHANGE_AUTHOR_DISPLAY_NAME >> $JOB_BASE_NAME-$POM_VERSION.txt
sed -i '/Date/s/:/-/2g' $JOB_BASE_NAME-$POM_VERSION.txt
awk -F: 'BEGIN {print "{" }{print "\"" $1"\":" " \""$2"\","}END{print "}"}' $JOB_BASE_NAME-$POM_VERSION.txt > $JOB_BASE_NAME-$POM_VERSION.json
sed -i '/Date/s/-/:/g' $JOB_BASE_NAME-$POM_VERSION.json
git add --all
git config user.email "sujit@addteq.com"
git config user.name "sujitkumar"
git commit -am "$GIT_AUTHOR has made a new change for this $JOB_NAME"
set +x
git pull https://${credentials}@github.com/kumar-sujit/Tracker.git master
git push https://${credentials}@github.com/kumar-sujit/Tracker.git master
