#!bin/bash

# get environment variables
source schedule/setup/env-var.sh
# stand up container
docker pull docker.pkg.github.com/epiforecasts/covid/covid:latest
docker tag docker.pkg.github.com/epiforecasts/covid/covid:latest covid-website
docker run -d -p 12001:8787 --name covid-website --mount ${MOUNT_NETRC} --mount ${MOUNT_GITCONFIG} -e USER=covid-website -e PASSWORD=covid-website covid-website
# clone in site
docker exec covid-website git clone  https://github.com/epiforecasts/covid.git
