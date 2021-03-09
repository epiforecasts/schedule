#!bin/bash

# check repository is up to date and update dependencies
. schedule/jobs/europe-covid-forecast/pull.sh

# run forecasts
docker exec -w /home/rstudio/europe-covid-forecast forecast bash rt-forecast/update.sh

# update github with new forecast
docker exec -w /home/rstudio/europe-covid-forecast forecast  bash -c "git add -A ; git commit -m 'automated Rt update' ; git pull -Xours; git push"
