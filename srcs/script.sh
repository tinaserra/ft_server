#! /bin/bash

service nginx start
service mysql restart
service php-fpm sretart
tail -f /dev/null
