#!bin/bash

# check repository is up to date
sudo docker exec -w /home/rstudio/covid-uk spim git pull -Xours

# run forecasts
sudo docker exec -w /home/rstudio/covid-uk spim bash bin/update-forecasts.sh

# update github with new forecast
sudo docker exec -w /home/rstudio/covid-uk "git add -A ; git commit -m 'automated update' ; git pull -Xours; git push"
