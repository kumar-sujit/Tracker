git clone https://sujit-kumar:arankal%4089@github.com/bugzilla/$MicroServiceName.git
cd $MicroServiceName
Git_Tag_Commit=`git rev-list --tags --max-count=1`
Git_Latest_Tag=`git describe --tags $Git_Tag_Commit`
echo $Git_Latest_Tag
cd ..
rm -rf $Microservice.git
echo "Tag after removing directory :"$Git_Latest_Tag
cp $MicroServiceName.txt $MicroServiceName-v1.txt
echo "MicroService Name" : "$MicroServiceName" > $MicroServiceName.txt
echo "Branch Name" : "$BranchName" >> $MicroServiceName.txt
echo "Build Number : "$BuildNumber >> $MicroServiceName.txt
echo "GitTagg      : " $GitTag >> $MicroServiceName.txt
cat $MicroServiceName.txt
cat $MicroServiceName-v1.txt
ls -l $MicroServiceName*


The copy command in the line 9 helps us to retain both the latest and the one before latest in our repository..
