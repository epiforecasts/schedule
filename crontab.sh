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
0 11 * * * /bin/bash cd schedule && git pull -Xtheirs >> schedule/logs/schedule.log 2>&1
# update the crontab at 11.30pm
30 11 * * * /bin/bash schedule/jobs/crontab.sh >> schedule/logs/crontab.log 2>&1
# run ECDC forecast at 8am on Sunday
0 8 * * 0 /bin/bash schedule/jobs/europe-covid-forecast/rt.sh > schedule/logs/europe-covid-forecast/rt.log 2>&1
# run inc2prev at 3pm on Friday
0 15 * * 5 /bin/bash schedule/jobs/inc2prev-ons/ons.sh > schedule/logs/inc2prev-ons/ons.log 2>&1
