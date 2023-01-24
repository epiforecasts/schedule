#!bin/bash

# check repository is up to date and update dependencies
. schedule/jobs/inc2prev/pull.sh

# produce estimates
docker exec -w /home/vscode/inc2prev inc2prev-obs bash scripts/update.sh

# publish estimates
docker exec -w /home/vscode/inc2prev inc2prev-obs bash scripts/publish.sh
