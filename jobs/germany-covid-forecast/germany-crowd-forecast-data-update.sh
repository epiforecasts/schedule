#!bin/bash

# check repository is up to date and update dependencies
/bin/bash schedule/jobs/germany-covid-forecasts/update-dependencies.sh

# Redeploy forecast app (to update data)
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript human-forecast/redeploy-forecast-app.R

# rerun evaluation / leaderboard
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript evaluation/forecast-evaluation.R

# update github with new forecast
docker exec -w /home/rstudio/covid-german-forecasts forecast  bash -c "git add -A ; git commit -m 'automated crowd data update' ; git pull -Xours; git push"
