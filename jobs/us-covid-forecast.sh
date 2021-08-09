#!bin/bash

# make sure required container is running
docker start forecast

# check repository is up to date
docker exec -w /home/rstudio/covid-us-forecasts forecast git pull -Xours

# run forecasts
docker exec -w /home/rstudio/covid-us-forecasts forecast bash bin/forecast.sh

# update github with new forecast
docker exec -w /home/rstudio/covid-us-forecasts forecast bash -c "git add -A ; git commit -m 'automated forecast update' ; git pull -Xours; git push"
