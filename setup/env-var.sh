#!bin/bash

MOUNT_NETRC=type=bind,source=$(realpath ~)/.netrc,target=/root/.netrc,readonly
MOUNT_GITCONFIG=type=bind,source=$(realpath ~)/.gitconfig,target=/root/.gitconfig,readonly
