cd /home/addteq/prabhu_test1
pwd
echo $JOB_BASE_NAME
echo "MicroService Name" : "$JOB_BASE_NAME" > $JOB_BASE_NAME.txt
echo "Branch Name" : "$GIT_BRANCH" >> $JOB_BASE_NAME.txt
echo "Build Number : "$BUILD_NUMBER >> $JOB_BASE_NAME.txt
echo "Commit ID : "$GIT_COMMIT >> $JOB_BASE_NAME.txt
echo "Date : " `date +"%c"` >> $JOB_BASE_NAME.txt
echo "Build Tag : " $BUILD_TAG >> $JOB_BASE_NAME.txt
echo "Change Author : "$CHANGE_AUTHOR_DISPLAY_NAME >> $JOB_BASE_NAME.txt
sed -i '/Date/s/:/-/2g' $JOB_BASE_NAME.txt
awk -F: 'BEGIN {print "{" }{print "\"" $1"\":" " \""$2"\","}END{print "}"}' $JOB_BASE_NAME.txt > $JOB_BASE_NAME.json
sed -i '/Date/s/-/:/g' $JOB_BASE_NAME.json
git add --all
git config user.email "sujit@addteq.com"
git config user.name "sujitkumar"
git commit -am "$GIT_AUTHOR has made a new change for this $JOB_NAME"
set +x
git pull https://${credentials}@github.com/kumar-sujit/Tracker.git master
git push https://${credentials}@github.com/kumar-sujit/Tracker.git master
