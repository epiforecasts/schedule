#!bin/bash

# check repository is up to date and update dependencies
/bin/bash schedule/jobs/germany-covid-forecasts/update-dependencies.sh

# run forecasts
docker exec -w /home/rstudio/covid-german-forecasts forecast bash rt-forecast/update.sh

# redeploy rt crowd forecast app
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript rt-crowd-forecast/redeploy-rt-forecast-app.R

# update github with new forecast
docker exec -w /home/rstudio/covid-german-forecasts forecast  bash -c "git add -A ; git commit -m 'automated forecast update' ; git pull -Xours; git push"
