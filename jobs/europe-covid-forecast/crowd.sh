#!bin/bash

# check repository is up to date and update dependencies
. schedule/jobs/europe-covid-forecast/pull.sh

# update direct crowd forecast
docker exec -w /home/rstudio/europe-covid-forecast forecast bash crowd-direct-forecast/update.sh

# update crowd rt forecast
docker exec -w /home/rstudio/europe-covid-forecast forecast bash crowd-rt-forecast/update.sh

# update crowd forecast
docker exec -w /home/rstudio/europe-covid-forecast forecast Rscript crowd-forecast/update.R

# update github with new forecast
docker exec -w /home/rstudio/europe-covid-forecast forecast  bash -c "git add -A ; git commit -m 'automated crowd update' ; git pull -Xours; git push"

# update evaluations
docker exec -w /home/rstudio/europe-covid-forecast forecast bash reports/update.sh

# update evaluation website
docker exec -w /home/rstudio/europe-covid-forecast forecast bash reports/update-website.sh

# update github with evaluation
docker exec -w /home/rstudio/europe-covid-forecast forecast  bash -c "git add -A ; git commit -m 'automated evaluation update' ; git pull -Xours; git push"
