#!bin/bash

# make sure required container is running
docker start inc2prev-ons

# check repository is up to date
docker exec -w /home/vscode/inc2prev inc2prev-ons git pull -Xours

# update dependencies
docker exec -w /home/vscode/inc2prev inc2prev-ons Rscript -e 'devtools::install_dev_deps()'
docker exec -w /home/vscode/inc2prev inc2prev-ons Rscript -e 'devtools::install(".")'
