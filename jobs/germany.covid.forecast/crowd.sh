#!bin/bash

# check repository is up to date and update dependencies
. schedule/jobs/germany.covid.forecasts/pull.sh

# update crowd forecast
docker exec -w /home/rstudio/covid.german.forecasts forecast bash crowd-forecast/update.sh

# update Rt crowd forecast 
docker exec -w /home/rstudio/covid.german.forecasts forecast bash rt.crowd.forecast/update.sh

# update evaluations
docker exec -w /home/rstudio/covid.german.forecasts forecast bash evaluation/update.sh

# update github with new forecast
docker exec -w /home/rstudio/covid.german.forecasts forecast  bash -c "git add -A ; git commit -m 'automated crowd update' ; git pull -Xours; git push"
