#!bin/bash

# run the updater script stored in covid/bin/update.sh
sudo docker exec -w /home/rstudio/covid covid-website bash bin/update.sh
