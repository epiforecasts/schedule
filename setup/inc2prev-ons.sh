#!bin/bash

# get environment variables
source schedule/setup/env-var.sh
# stand up container
docker pull ghcr.io/epiforecasts/inc2prev:master
docker tag ghcr.io/epiforecasts/inc2prev:master inc2prev-ons
docker run -d -p 12004:8787 --name inc2prev-ons --mount ${MOUNT_NETRC} --mount ${MOUNT_GITCONFIG} -e USER=inc2prev-ons -e PASSWORD=inc2prev-ons inc2prev-ons tail -f /dev/null
# clone in site
docker exec -w /home/vscode inc2prev-ons git clone  https://github.com/epiforecasts/inc2prev.git
# install dependencies
docker exec -w /home/vscode/inc2prev inc2prev-ons Rscript -e "devtools::install_dev_deps()"
