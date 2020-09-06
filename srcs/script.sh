#! /bin/bash

# Nginx
mv ./default etc/nginx/sites-available
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# Start
service nginx start
service mysql restart
service php-fpm sretart
tail -f /dev/null
