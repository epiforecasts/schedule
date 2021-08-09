#!bin/bash

# make sure required container is running
docker start spim

# check repository is up to date
docker exec -w /home/rstudio/covid-uk spim git pull -Xours

# update EpiNow2
docker exec -w /home/rstudio/covid-uk spim Rscript -e 'install.packages("EpiNow2", repos = "https://epiforecasts.r-universe.dev")'

# run forecasts
docker exec -w /home/rstudio/covid-uk spim bash bin/update-forecasts.sh

# update github with new forecast
docker exec -w /home/rstudio/covid-uk spim bash -c "git add -A ; git commit -m 'automated update' ; git pull -Xours; git push"
