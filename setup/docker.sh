#!bin/bash

sudo apt-get update
sudo apt-get install -y docker.io
docker login docker.pkg.github.com
sudo groupadd docker
sudo usermod -aG docker $USER
