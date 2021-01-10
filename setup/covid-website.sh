#!bin/bash

# get environment variables
source schedule/setup/env-var.sh
# stand up container
sudo docker pull docker.pkg.github.com/epiforecasts/covid/covid:latest
sudo docker tag docker.pkg.github.com/epiforecasts/covid/covid:latest covid-website
sudo docker run -d -p 12001:8787 --name covid-website --mount ${MOUNT_NETRC} --mount ${MOUNT_GITCONFIG} -e USER=covid-website -e PASSWORD=covid-website covid-website
# clone in site
sudo docker exec covid-website git clone  https://github.com/epiforecasts/covid.git
