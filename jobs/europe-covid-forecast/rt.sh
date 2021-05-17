#!bin/bash

# check repository is up to date and update dependencies
. schedule/jobs/europe-covid-forecast/pull.sh

# run forecasts
docker exec -w /home/rstudio/europe-covid-forecast forecast bash rt-forecast/update.sh

# Redeploy crowd rt forecast app with updated data
docker exec -w /home/rstudio/europe-covid-forecast forecast Rscript crowd-rt-forecast/redeploy.R

# update github with new forecast
docker exec -w /home/rstudio/europe-covid-forecast forecast  bash -c "git add -A ; git commit -m 'automated Rt update' ; git pull -Xours; git push"
