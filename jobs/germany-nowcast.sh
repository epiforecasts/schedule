#!bin/bash

# make sure required container is running
docker start eval-germany-sp-nowcasting

# make sure it has the right permissions and is up to date
docker exec -w /eval-germany-sp-nowcasting eval-germany-sp-nowcasting chmod -R ugo+rw .
docker exec -u vscode -w /eval-germany-sp-nowcasting eval-germany-sp-nowcasting git pull

# run the updater script
docker exec -u vscode -w /eval-germany-sp-nowcasting eval-germany-sp-nowcasting  bash bin/update-targets-and-publish.sh

docker exec  -w /eval-germany-sp-nowcasting eval-germany-sp-nowcasting git push
