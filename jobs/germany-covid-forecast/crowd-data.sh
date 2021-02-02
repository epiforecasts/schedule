#!bin/bash

# check repository is up to date and update dependencies
/bin/bash schedule/jobs/germany-covid-forecasts/pull.sh

# Redeploy forecast app (to update data)
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript human-forecast/redeploy.R

# rerun evaluation / leaderboard
docker exec -w /home/rstudio/covid-german-forecasts forecast bash evaluation/update.sh

# update github with new forecast
docker exec -w /home/rstudio/covid-german-forecasts forecast  bash -c "git add -A ; git commit -m 'automated crowd data update' ; git pull -Xours; git push"
