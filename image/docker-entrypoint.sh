#!/bin/bash

## Docker Start
DOCKER_CONTAINER_LISTENER_START="/var/www/application/docker/prepare/docker-start.sh"
if [ ! \( -L "${DOCKER_CONTAINER_LISTENER_START}" \) ]; then
	sh "${DOCKER_CONTAINER_LISTENER_START}";
fi

## Start Services
cd /var/www/application
/etc/rc.d/init.d/php-fpm start
/etc/init.d/nginx start
/usr/bin/htop
/bin/bash