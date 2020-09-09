#! /bin/bash

# Config Nginx
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
# chown -R www-data /var/www/*
# chmod -R 755 /var/www/*

# Start
service nginx start
service mysql restart
service php7.3-fpm start
sleep infinity
# tail -f /dev/null
