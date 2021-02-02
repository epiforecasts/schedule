#!bin/bash

# check repository is up to date
docker exec -w /home/rstudio/covid-german-forecasts forecast git pull -Xours

# update dependencies
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript -e 'devtools::install_github("epiforecasts/covid-german-forecasts")'

# Redeploy forecast app (to update data)
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript human-forecast/redeploy-forecast-app.R

# rerun evaluation / leaderboard
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript evaluation/forecast-evaluation.R

# update github with new forecast
docker exec -w /home/rstudio/covid-german-forecasts forecast  bash -c "git add -A ; git commit -m 'automated crowd data update' ; git pull -Xours; git push"
