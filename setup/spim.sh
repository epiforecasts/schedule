#!bin/bash

# get environment variables
bash schedule/setup/env-var.sh
# get SPI-M container
sudo docker pull docker.pkg.github.com/epiforecasts/covid-uk/coviduk:latest
sudo docker tag docker.pkg.github.com/epiforecasts/covid-uk/coviduk:latest spim
# launch container
sudo docker run -d -p 12002:8787 --name spim --mount ${MOUNT_NETRC} --mount ${MOUNT_GITCONFIG} -e USER=spim -e PASSWORD=spim spim
# clone in repository
sudo docker exec spim git clone https://github.com/epiforecasts/covid-uk.git
