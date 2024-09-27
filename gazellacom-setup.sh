#!/bin/bash

# Swisstech.solutions
# autor: alexander.aguilar@swisstech.solutions
#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
RETVAL=0
BACKUPDATE="$(date +'%Y%m%d-%H%M')"

REPO_SSH=git@github.com:alexolomeo/awx.swisstech.playbook.git
REPO_NAME=awx.swisstech.playbook

##
## Prepare repository
##

repository ()
{
	\rm -rf roles key $REPO_NAME

	git clone $REPO_SSH

	ln -s $REPO_NAME/roles roles
}

remove_repository ()
{
	\rm -rf roles key awx.swisstech.playbook

}

usage ()
{
	echo $"Usage: $0 {integration|int|production|prod}" 1>&2
	RETVAL=2
}

integration ()
{
	repository

	ansible-playbook -i inventory/setup.inventory gazellacom.config.integration.yml
	
	remove_repository
}

production ()
{
	repository

	ansible-playbook -i inventory/setup.inventory gazellacom.config.production.yml

	remove_repository
}


case "$1" in
    integration|int) integration ;;
    production|prod) production ;;
    *) usage ;;
esac

exit $RETVAL
