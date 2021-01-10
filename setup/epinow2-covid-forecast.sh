#!bin/bash

# set up EpiNow2 based docker container for forecasting
 sudo bash schedule/setup/epinow2.sh 12003 forecast
# clone in US forecasting repository
 sudo docker exec forecast git clone https://github.com/epiforecasts/covid-us-forecasts.git
 # clone in Germany/Poland forecasting repository
 sudo docker exec forecast git clone  https://github.com/epiforecasts/covid-german-forecasts.git
 # install us dependencies
 sudo docker exec -w /home/rstudio/covid-us-forecasts forecast Rscript -e "devtools::install_dev_deps()"
 # install germany dependencies
 sudo docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript -e "devtools::install_dev_deps()"
