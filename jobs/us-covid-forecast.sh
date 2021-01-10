#!bin/bash

# check repository is up to date
sudo docker exec -w /home/rstudio/covid-us-forecasts forecast git pull -Xours

# run forecasts
sudo docker exec -w /home/rstudio/covid-us-forecasts forecast bash bin/forecast.sh

# update github with new forecast
sudo docker exec -w /home/rstudio/covid-us-forecasts "git add -A ; git commit -m 'automated forecast update' ; git pull -Xours; git push"
