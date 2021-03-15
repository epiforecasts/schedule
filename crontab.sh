# Edit this file to introduce tasks to be run by cron
# and then use crontab < schedule/crontab.sh to add to crontab
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs is saved in /schedule/logs/job-name.logs.
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command
# update the schedule folder at 11pm
11 * * * * /bin/bash cd schedule && git pull -Xtheirs
# update the covid website at 6 am and pm
0 6 * * * /bin/bash schedule/jobs/covid-website.sh >> schedule/logs/covid-website.log 2>&1
0 18 * * * /bin/bash schedule/jobs/covid-website.sh >> schedule/logs/covid-website.log 2>&1
# run the US forecast on Monday at 12.30 am
30 0 * * 1 /bin/bash schedule/jobs/us-covid-forecast.sh > schedule/logs/us-covid-forecast.log 2>&1
# run ECDC forecast at 9pm on Sunday
0 21 * * 7 /bin/bash schedule/jobs/europe-covid-forecast/rt.sh > schedule/logs/europe-covid-forecast/rt.log 2>&1
# run the Germany/Poland forecast on Monday at 4 am
0 4 * * 1 /bin/bash schedule/jobs/germany.covid.forecasts/rt.sh > schedule/logs/germany.covid.forecasts/rt.log 2>&1
# update European crowd forecast data on Sunday at 7.30 am
30 7 * * 7 /bin/bash schedule/jobs/europe-covid-forecast/crowd-data.sh > schedule/logs/europe-covid-forecast/crowd-data.log 2>&1
# update European crowd forecast submission on Monday at 10 pm
0 22 * * 1 /bin/bash schedule/jobs/europe-covid-forecast/crowd.sh > schedule/logs/europe-covid-forecast/crowd.log 2>&1
# update crowd forecasts for Germany / Poland on Monday at 10.30 pm
30 22 * * 1 /bin/bash schedule/jobs/germany.covid.forecasts/crowd.sh > schedule/logs/germany.covid.forecasts/crowd.log 2>&1
# run all SPIM tasks at 3am on Monday (as a test) and 2am on Tuesday (for SPI-M submission)
0 3 * * 1 /bin/bash schedule/jobs/spim.sh > schedule/logs/spim.log 2>&1
0 2 * * 2 /bin/bash schedule/jobs/spim.sh > schedule/logs/spim.log 2>&1
