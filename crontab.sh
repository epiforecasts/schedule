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
# update the covid website at 6 am, 12am, 6pm and 12 pm every day
0 */6 * * * /bin/bash schedule/jobs/covid-website.sh > schedule/logs/covid-website.log 2>&1
# run the US forecast on Monday at 12.30 am
30 0 * * 1 /bin/bash schedule/jobs/us-covid-forecast.sh > schedule/logs/us-covid-forecast.log 2>&1
# run the Germany/Poland forecast on Monday at 4 am
0 4 * * 1 /bin/bash schedule/jobs/germany-covid-forecast.sh > schedule/logs/germany-covid-forecast.log 2>&1
# update crowd forecasts on a Tuesday Evening at 7pm
0 19 * * 2 /bin/bash schedule/jobs/germany-crowd-forecast.sh > schedule/logs/germany-crowd-forecast.log 2>&1
# run all SPIM tasks at 7am on Monday (as a test) and 2am on Tuesday (for SPI-M submission)
0 7 * * 1 /bin/bash schedule/jobs/spim.sh > schedule/logs/spim.log 2>&1
0 2 * * 2 /bin/bash schedule/jobs/spim.sh > schedule/logs/spim.log 2>&1
