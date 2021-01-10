#!bin/bash

sudo docker pull docker.pkg.github.com/epiforecasts/covid/covid:latest
sudo docker tag docker.pkg.github.com/epiforecasts/covid/covid:latest covid-website
sudo docker run -d -p 12001:8787 --name covid-website -e USER=covid-website -e PASSWORD=covid-website covid-website
