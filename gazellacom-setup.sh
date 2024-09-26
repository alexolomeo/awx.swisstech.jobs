#!/bin/bash

# Swisstech.solutions
# autor: alexander.aguilar@swisstech.solutions
#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

BACKUPDATE="$(date +'%Y%m%d-%H%M')"

##
## Prepare repository
##

git clone git@github.com:alexolomeo/awx.swisstech.playbook.git

ln -s awx.swisstech.playbook/roles roles

ansible-playbook -i inventory/setup.gomax.integration gazellacom.config.integration.yml

