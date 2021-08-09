#!bin/bash

# make sure required container is running
docker start forecast

# check repository is up to date
docker exec -w /home/rstudio/covid.german.forecasts forecast git pull -Xours

# update dependencies
docker exec -w /home/rstudio/covid.german.forecasts forecast Rscript -e 'devtools::install_github("epiforecasts/covid.german.forecasts")'
docker exec -w /home/rstudio/covid.german.forecasts forecast Rscript -e 'devtools::install_dev_deps()'
