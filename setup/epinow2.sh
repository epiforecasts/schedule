#!bin/bash
# example:  sudo bash schedule/setup/epinow2.sh 10787 joel
sudo docker pull docker.pkg.github.com/epiforecasts/epinow2/epinow2:latest
sudo docker tag docker.pkg.github.com/epiforecasts/epinow2/epinow2:latest epinow2
sudo docker run -d -p $1:8787 --name $2 -e USER=$2 -e PASSWORD=$2 epinow2
