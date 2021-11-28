#!bin/bash

# set up an EpiNow2 covid forecasting container
. schedule/setup/epinow2-covid-forecast.sh

# set up a container to update the covid website
. schedule/setup/covid-website.sh

# set up a container to use for SPI-M submissions
. schedule/setup/spim.sh

# setup the container for germany nowcasting
. schedule/setup/germany-nowcast.sh