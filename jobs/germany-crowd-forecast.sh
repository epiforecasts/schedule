#!bin/bash

# check repository is up to date
docker exec -w /home/rstudio/covid-german-forecasts forecast git pull -Xours

# update dependencies
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript -e 'devtools::install_github("epiforecasts/covid-german-forecasts")'

# simulate cases from Rt crowd forecast
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript rt-crowd-forecast/simulate-cases.R

# update github with new forecast
docker exec -w /home/rstudio/covid-german-forecasts forecast  bash -c "git add -A ; git commit -m 'automated crowd update' ; git pull -Xours; git push"
