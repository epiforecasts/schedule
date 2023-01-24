#!bin/bash

# get environment variables
source schedule/setup/env-var.sh
# set up EpiNow2 based docker container for forecasting
. schedule/setup/epinow2.sh 12003 forecast
# clone in ECDC forecasting repository
docker exec -w /home/vscode forecast git clone  https://github.com/epiforecasts/europe-covid-forecast.git
# install ecdc dependencies
docker exec -w /home/vscode/europe-covid-forecast forecast Rscript -e "devtools::install_dev_deps()"
