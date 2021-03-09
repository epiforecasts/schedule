#!bin/bash

# check repository is up to date and update dependencies
. schedule/jobs/europe-covid-forecast/pull.sh

# update crowd forecast
docker exec -w /home/rstudio/europe-covid-forecast forecast bash crowd-forecast/update.sh

# update Rt crowd forecast 
docker exec -w /home/rstudio/europe-covid-forecast forecast bash rt-crowd-forecast/update.sh

# update evaluations
docker exec -w /home/rstudio/europe-covid-forecast forecast bash evaluation/update.sh

# update github with new forecast
docker exec -w /home/rstudio/europe-covid-forecast forecast  bash -c "git add -A ; git commit -m 'automated crowd update' ; git pull -Xours; git push"
