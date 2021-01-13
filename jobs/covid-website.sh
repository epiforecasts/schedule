#!bin/bash

# update dependencies
docker exec -w /home/rstudio/covid covid-website Rscript -e "devtools::install_dev_deps()"

# run the updater script stored in covid/bin/update.sh
docker exec -w /home/rstudio/covid covid-website bash bin/update.sh
