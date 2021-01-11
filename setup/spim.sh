#!bin/bash

# get environment variables
source schedule/setup/env-var.sh
# get SPI-M container
docker pull docker.pkg.github.com/epiforecasts/covid-uk/coviduk:latest
docker tag docker.pkg.github.com/epiforecasts/covid-uk/coviduk:latest spim
# launch container
docker run -d -p 12002:8787 --name spim --mount ${MOUNT_NETRC} --mount ${MOUNT_GITCONFIG} -e USER=spim -e PASSWORD=spim spim
# remove old code
docker exec -w /home/rstudio spim rm -r -f covid-uk
# clone in repository
docker exec -w /home/rstudio spim git clone https://github.com/epiforecasts/covid-uk.git
