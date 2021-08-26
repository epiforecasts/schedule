#!bin/bash

# check repository is up to date and update dependencies
. schedule/jobs/europe-covid-forecast/pull.sh

# update data
docker exec -w /home/rstudio/europe-covid-forecast forecast Rscript data-raw/update.R

# Redeploy forecast app (to update data)
docker exec -w /home/rstudio/europe-covid-forecast forecast Rscript crowd-direct-forecast/redeploy.R

# update evaluation website
docker exec -w /home/rstudio/europe-covid-forecast forecast bash reports/update-website.sh

# update github with new forecast
docker exec -w /home/rstudio/europe-covid-forecast forecast  bash -c "git add -A ; git commit -m 'automated crowd data update' ; git pull -Xours; git push"

# run weekly emails
docker exec -w /home/rstudio/europe-covid-forecast forecast Rscript crowd-forecast/send-emails.R
