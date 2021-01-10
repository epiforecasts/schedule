#!bin/bash

# get environment variables
source schedule/setup/env-var.sh
# set up EpiNow2 based docker container for forecasting
sudo docker pull docker.pkg.github.com/epiforecasts/epinow2/epinow2:latest
sudo docker tag docker.pkg.github.com/epiforecasts/epinow2/epinow2:latest forecast
sudo docker run -d -p 12003:8787 --name forecast --mount ${MOUNT_NETRC} --mount ${MOUNT_GITCONFIG} -e USER=forecast -e PASSWORD=forecast forecast
# clone in US forecasting repository
sudo docker exec forecast git clone https://github.com/epiforecasts/covid-us-forecasts.git
# clone in Germany/Poland forecasting repository
sudo docker exec forecast git clone  https://github.com/epiforecasts/covid-german-forecasts.git
# install us dependencies
sudo docker exec -w /home/rstudio/covid-us-forecasts forecast Rscript -e "devtools::install_dev_deps()"
# install germany dependencies
sudo docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript -e "devtools::install_dev_deps()"
