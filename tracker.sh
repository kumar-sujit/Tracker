cd /home/addteq/prabhu_test1
echo "MicroService Name : "$JOB_NAME > tracker.txt
echo "Branch Name : "$GIT_BRANCH >> tracker.txt
echo "Build Number : "$BUILD_NUMBER >> tracker.txt
echo "Commit ID : "$GIT_COMMIT >> tracker.txt
echo "Date : " `date +"%c"` >> tracker.txt
git add --all
git config user.email "sujit@addteq.com"
git config user.name "sujitkumar"
git commit -am "$GIT_AUTHOR has made a new change for this $JOB_NAME"
git push https://<username>:<password>github.com/kumar-sujit/Tracker.git
