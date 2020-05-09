#!/bin/bash
echo "Docker Start";

# Host Settings
echo "-- Host Settings";
if [ ! \( -L "/var/www/application/docker/prepare/etc/hosts" \) ]; then
	cat "/var/www/application/docker/prepare/etc/hosts" | tee --append "/etc/hosts";
fi

# Nginx Settings
echo "-- Nginx Settings";
if [ ! \( -L "/var/www/application/docker/prepare/nginx/dev.myapplication.com.conf" \) ]; then
	ln -s "/var/www/application/docker/prepare/nginx/dev.myapplication.com.conf" "/etc/nginx/conf.d/dev.myapplication.com.conf";
fi

# LOG
echo "-- LOG Settings";
if [ ! \( -L "/var/www/application/log" \) ]; then
	chmod 0775 -Rf "/var/www/application/log";
fi
