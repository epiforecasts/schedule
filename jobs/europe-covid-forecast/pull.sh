#!bin/bash

# check repository is up to date
docker exec -w /home/rstudio/europe-covid-forecast forecast git pull -Xours

# update dependencies
docker exec -w /home/rstudio/europe-covid-forecast forecast Rscript -e 'devtools::install_dev_deps()'
docker exec -w /home/rstudio/europe-covid-forecast forecast Rscript -e 'devtools::install(".")'