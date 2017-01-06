rm -rf Tracker
git clone -b Stage --single-branch https://github.com/kumar-sujit/Tracker.git
cd Tracker
#Git_Tag_Commit=`git rev-list --tags --max-count=1`
#Git_Latest_Tag=`git describe --tags $Git_Tag_Commit`
#echo $Git_Latest_Tag
#cd ..
#rm -rf $Microservice
#echo "Tag after removing directory :"$Git_Latest_Tag
#cp $MicroServiceName.txt $MicroServiceName-v1.txt
echo "MicroService Name" : "$MicroServiceName" > $MicroServiceName.txt
echo "Branch Name" : "$BranchName" >> $MicroServiceName.txt
echo "Build Number : "$BuildNumber >> $MicroServiceName.txt
echo "GitTagg      : " $GitTag >> $MicroServiceName.txt
awk -F: 'BEGIN {print "{" }{print "\"" $1"\":" " \""$2"\","}END{print "}"}' $MicroServiceName.txt > $MicroServiceName.json
git add --all
git config user.email "sujit@addteq.com"
git config user.name "sujitkumar"
git commit -am "$GIT_AUTHOR has made a new change for this $MicroServiceName"
#set +x
#git pull https://${credentials}@github.com/kumar-sujit/Tracker.git Dev
git push https://${credentials}@github.com/kumar-sujit/Tracker.git Stage


echo $GIT_COMMIT
if [ $ROLLBACK != "NO" ]; then
wget https://github.com/kumar-sujit/Tracker/raw/Stage/tracker.json
GIT_COMMIT=`grep "Commit ID" tracker.json |  awk -F\" '{print $(NF-1)}'`
echo $GIT_COMMIT
fi


echo $GIT_COMMIT
if [ $ROLLBACK != "NO" ]; then
git clone --single-branch https://github.com/kumar-sujit/Tracker.git Stage
cd Tracker
GIT_COMMIT=`git show HEAD~2:tracker.json | grep "Commit ID" tracker.json |  awk -F\" '{print $(NF-1)}'`
echo $GIT_COMMIT
fi
