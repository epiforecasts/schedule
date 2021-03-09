#!bin/bash

# check repository is up to date
docker exec -w /home/rstudio/europe-covid-forecast forecast git pull -Xours

# update dependencies
docker exec -w /home/rstudio/europe-covid-forecast forecast Rscript -e 'devtools::install_github("epiforecasts/europe-covid-forecast")'
docker exec -w /home/rstudio/europe-covid-forecast forecast Rscript -e 'devtools::install_dev_deps()'
