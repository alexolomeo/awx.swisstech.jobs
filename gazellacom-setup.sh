#!/bin/bash

# Swisstech.solutions
# autor: alexander.aguilar@swisstech.solutions
#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
RETVAL=0
BACKUPDATE="$(date +'%Y%m%d-%H%M')"

##
## Prepare repository
##

\rm -rf roles key awx.swisstech.playbook

git clone git@github.com:alexolomeo/awx.swisstech.playbook.git

ln -s awx.swisstech.playbook/roles roles

usage ()
{
	echo $"Usage: $0 {integration|int|production|prod}" 1>&2
	RETVAL=2
}

integration ()
{
	ansible-playbook -i inventory/setup.integration gazellacom.config.integration.yml
}

production ()
{
	ansible-playbook -i inventory/setup.production gazellacom.config.production.yml
}


case "$1" in
    integration|int) integration ;;
    production|prod) production ;;
    *) usage ;;
esac

exit $RETVAL
