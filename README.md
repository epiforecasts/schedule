# Schedule EpiForecast Routine Server Jobs

This repository contains the setup scripts, job scripts and scheduling information required to automate routine EpiForecast jobs. It uses CRON, docker, and bash.

## Setup

1. Clone this repository using:

```
git clone https://github.com/epiforecasts/schedule.git
```

2. Install docker (using your Github username and a PAT code to sign in to the GitHub container registry):

```
. schedule/setup/docker.sh
```

3. Set up credential files at `~/.` (using `nano ~/.gitconfig` etc.):

```
.gitconfig:
[user]
    name = thomas the tank engine
    email = thomas.the.tank.engine@engines.com

.netrc:
machine github.com
login TtheTank
password github-pat

machine api.github.com
login TtheTank
password github-pat
```

4. Setup the container environments for all scheduled jobs (see `setup` for each individual container environment):

```
. schedule/setup/all.sh
```

## Jobs

Individual jobs are defined in `jobs` as `bash` scripts and use one of the container environments defined in `setup`.

## Schedule

Job scheduling is defined in `crontab.sh` - see [here](https://crontab.guru) for help defining a schedule for a job. Logs from each job are stored in the `logs` folder. After adding a job to `crontab.sh` or when setting up a new scheduling server use the following to update the `crontab`:

```
crontab < schedule/crontab.sh
```

Then check the `crontab` is as expected using:

```
crontab -l
```
