#!bin/bash

# make sure required container is running
docker start hungry_gates

# make sure it has the right permissions and is up to date
docker exec -u vscode -w /workspaces/omicron-sgtf-forecast hungry_gates git pull

# run the updater script
docker exec -u vscode -w /workspaces/omicron-sgtf-forecast hungry_gates  bash bin/update-if-new-data.sh

# copy in credentials and git as root
docker cp $(realpath ~)/.gitconfig hungry_gates:/root/.gitconfig
docker cp $(realpath ~)/.netrc hungry_gates:/root/.netrc
docker exec  -w /workspaces/omicron-sgtf-forecast hungry_gates  git push

