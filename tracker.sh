cd /home/addteq/prabhu_test1
echo "MicroService Name" : "$JOB_NAME" > $JOB_NAME.txt
echo "Branch Name" : "$GIT_BRANCH" >> $JOB_NAME.txt
echo "Build Number : "$BUILD_NUMBER >> $JOB_NAME.txt
echo "Commit ID : "$GIT_COMMIT >> $JOB_NAME.txt
echo "Date : " `date +"%c"` >> $JOB_NAME.txt
awk -F: 'BEGIN {print "{" }{print "\"" $1"\":" " \""$2"\","}END{print "}"}' $JOB_NAME.txt > $JOB_NAME.json
git add --all
git config user.email "sujit@addteq.com"
git config user.name "sujitkumar"
git commit -am "$GIT_AUTHOR has made a new change for this $JOB_NAME"
git pull https://kumar-sujit:arankal%4089@github.com/kumar-sujit/Tracker.git master
git push https://kumar-sujit:arankal%4089@github.com/kumar-sujit/Tracker.git master
