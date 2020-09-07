#! /bin/bash

# Nginx
mv ./default etc/nginx/sites-available
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#php
# mkdir var/www/phpmyadmin
# cd /tmp/
# wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
# tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
# mv phpMyAdmin-4.9.0.1-all-languages phpMyAdmin
# mv phpMyAdmin var/www/
# mv ./config.inc.php var/www/phpMyAdmin
# chmod 660 /var/www/phpMyAdmin/config.inc.php
# chown -R www-data:www-data /var/www/phpMyAdmin
# service php7.3-fpm start
# echo "GRANT ALL ON *.* TO 'vserra'@'localhost' IDENTIFIED BY '123'" | mysql -u root
# echo "FLUSH PRIVILEGES;" | mysql -u root
# rm -rf /tmp/

# Start
service nginx start
service mysql start
service php7.3-fpm restart
sleep infinity
# tail -f /dev/null
