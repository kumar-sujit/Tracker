sujit will you push the new code to script file and can you briefly exaplain where i need to execute the file.
Yeah Sai, I will document the steps need to be executed for the same.
Steps:
1. Generate the ssh-key on the jenkins machine for the user running jenkins . command : ssh-keygen -t rsa
2. It would create .ssh directory under the home directory of the user running jenkins.
3. copy the file id_rsa.pub file.
4. Go to the settings under the repository.
5. Go to the deploy keys
6. Add the copied ssh-key and check the box corresponding to "use ssh keys for pushing the code"
7. Save it.
8. Go to the jenkins machine and clone the repo once with the ssh url, so that the repository IP is stored in the known hosts of the jenkins machine.


Updated the script, please use the same to push the code to remote repository
