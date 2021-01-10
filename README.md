# Schedule EpiForecast Routine Server Jobs

This repository contains the setup scripts, job scripts and scheduling information required to automate routine EpiForecast jobs. It uses CRON, docker and bash.

## Setup

1. Clone this repository using:

```
git clone https://github.com/epiforecasts/schedule.git
```

2. Install docker (using your Github username and a PAT code to sign in to the GitHub container registry):

```
sudo bash schedule/setup/docker.sh
```

3. Setup the container environments for all scheduled jobs (see `setup` for each individual container environments):

```
sudo bash schedule/setup/all.sh
```

## Jobs

Individual jobs are defined in `jobs` and are run in one of the container environments defined in `setup`.

## Schedule

Job scheduling is defined in `cron.sh` - see [here](https://crontab.guru) for help defining a schedule for a job.
