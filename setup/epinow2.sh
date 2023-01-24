#!bin/bash
# example:  sudo bash schedule/setup/epinow2.sh 10787 joel
docker pull docker.pkg.github.com/epiforecasts/epinow2/epinow2:latest
docker tag docker.pkg.github.com/epiforecasts/epinow2/epinow2:latest $2
docker run -d -p $1:8787 --name $2 --mount ${MOUNT_NETRC} --mount ${MOUNT_GITCONFIG} -e USER=$2 -e PASSWORD=$2 $2 tail -f /dev/null
