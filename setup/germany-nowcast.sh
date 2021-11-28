#!bin/bash

# get environment variables
source schedule/setup/env-var.sh

# get the mounting repository locally if not present
#gill pull https://github.com/epiforecasts/eval-germany-sp-nowcasting.git

# workspace to mount
export WORKSPACE=source=$(realpath ~)/eval-germany-sp-nowcasting,target=/eval-germany-sp-nowcasting,type=bind,consistency=cached
# stand up container
docker pull ghcr.io/epiforecasts/eval-germany-sp-nowcasting:main
docker tag ghcr.io/epiforecasts/eval-germany-sp-nowcasting:main eval-germany-sp-nowcasting
docker run -d --name eval-germany-sp-nowcasting --mount ${MOUNT_NETRC} --mount ${MOUNT_GITCONFIG} --mount ${WORKSPACE}  eval-germany-sp-nowcasting tail -f /dev/null

