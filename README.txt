The pom version can be obtained in the mavenized jenkins job using the below command in the "execute shell" task of the buil/post build action.

echo $POM_VERSION

use the variable
GitTag = `git describe --tags `git rev-list --tags --max-count=1`
but this should be run at the top of the script
