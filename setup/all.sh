#!bin/bash

# set up an EpiNow2 covid forecasting container
sudo bash schedule/setup/epinow2-covid-forecast.sh

# set up a container to update the covid website
sudo bash schedule/setup/covid-website.sh

# set up a container to use for SPI-M submissions
sudo bash schedule/setup/spim.sh
