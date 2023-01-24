#!bin/bash

# make sure required container is running
docker start inc2prev-obs

# check repository is up to date
docker exec -w /home/vscode/inc2prev-obs forecast git pull -Xours

# update dependencies
docker exec -w /home/vscode/inc2prev-obs forecast Rscript -e 'devtools::install_dev_deps()'
docker exec -w /home/vscode/inc2prev-obs forecast Rscript -e 'devtools::install(".")'
