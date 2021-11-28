#!bin/bash

# make sure required container is running
docker start frosty_roentgen

# make sure it has the right permissions and is up to date
docker exec -w /eval-germany-sp-nowcasting frosty_roentgen chmod -R ugo+rw .
docker exec -u vscode -w /eval-germany-sp-nowcasting frosty_roentgen git pull

# run the updater script
docker exec -u vscode -w /eval-germany-sp-nowcasting frosty_roentgen  bash bin/update-targets-and-publish.sh

docker exec  -w /eval-germany-sp-nowcasting frosty_roentgen  git push
