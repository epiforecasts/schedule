#!bin/bash

# check repository is up to date
docker exec -w /home/rstudio/covid-german-forecasts forecast git pull -Xours

# update dependencies
docker exec -w /home/rstudio/covid-german-forecasts forecast Rscript -e 'devtools::install_github("epiforecasts/covid-german-forecasts")'

# run forecasts
docker exec -w /home/rstudio/covid-german-forecasts forecast bash rt-forecast/update.sh

# update github with new forecast
docker exec -w /home/rstudio/covid-german-forecasts forecast  bash -c "git add -A ; git commit -m 'automated forecast update' ; git pull -Xours; git push"
