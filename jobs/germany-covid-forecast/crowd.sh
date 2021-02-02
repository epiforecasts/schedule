#!bin/bash

# check repository is up to date and update dependencies
/bin/bash schedule/jobs/germany-covid-forecasts/update-dependencies.sh

# create crowd forecast app submission data
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript human-forecast/update-submissions.R

# Redeploy forecast app (to update submission date to next week)
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript human-forecast/redeploy-forecast-app.R

# update Rt crowd forecast samples
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript rt-crowd-forecast/update-samples.R

# simulate cases from Rt crowd forecast
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript rt-crowd-forecast/simulate-cases.R

# Redeploy Rt forecast app (to update submission date to next week)
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript rt-crowd-forecast/redeploy-rt-crowd-forecast-app.R

# rerun evaluation / leaderboard
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript evaluation/forecast-evaluation.R

# update github with new forecast
docker exec -w /home/rstudio/covid-german-forecasts forecast  bash -c "git add -A ; git commit -m 'automated crowd update' ; git pull -Xours; git push"
