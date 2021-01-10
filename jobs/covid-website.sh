#!bin/bash

# run the updater script stored in covid/bin/update.sh
docker exec -w /home/rstudio/covid covid-website bash bin/update.sh
