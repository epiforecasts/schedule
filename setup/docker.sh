#!bin/bash

apt-get update
apt-get install -y docker.io
docker login docker.pkg.github.com
sudo groupadd docker
sudo usermod -aG docker $USER
