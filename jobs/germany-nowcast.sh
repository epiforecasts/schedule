#!bin/bash

# make sure required container is running
docker start confident_jemison

# run the updater script
docker exec -w /eval-germany-sp-nowcasting confident_jemison bash bin/update-targets-and-publish.sh