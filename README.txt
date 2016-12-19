The pom version can be obtained in the mavenized jenkins job using the below command in the "execute shell" task of the buil/post build action.

echo $POM_VERSION

use the variable
GitTag = `git describe --tags `git rev-list --tags --max-count=1`
but this should be run at the top of the script


start of the script:
git clone <git url with microservice name>$Microservice.git
cd $Microservice
Git_Tag_Commit=`git rev-list --tags --max-count=1`
Git_Latest_Tag=`git describe --tags $Git_Tag_Commit`
echo $Git_Latest_Tag
cd ..
rm -rf $Microservice.git
echo "Tag after removing directory :"$Git_Latest_Tag
Rest of the old script
my colleguge is able to get the latest tag with this

git init
git config --global user.email "david.johnston@optum.com"
git config --global user.name "david johnston"
git remote set-url origin https://djohnst2:${djohnst2}@codehub.optum.com/propel/braas.git

# Get new tags from remote
git fetch --tags

# Get latest tag name
latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)

echo $latestTag


*******
Can you send the full script that i can execute
