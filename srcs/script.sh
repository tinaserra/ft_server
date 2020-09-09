#! /bin/bash

# Nginx
mv ./default etc/nginx/sites-available
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#PHPMYADMIN
# cd /tmp/
# wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
# tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
# mv phpMyAdmin-4.9.0.1-all-languages var/www/phpmyadmin
# mv ./config.inc.php var/www/phpmyadmin
# chmod 660 /var/www/phpmyadmin/config.inc.php
# chown -R www-data:www-data /var/www/phpmyadmin
# service php7.3-fpm start
# echo "GRANT ALL ON *.* TO 'emma'@'localhost' IDENTIFIED BY '123'" | mysql -u root
# echo "FLUSH PRIVILEGES;" | mysql -u root

# PHP
mkdir /var/www/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar xzf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components=1 -C /var/www/phpmyadmin
# cp srcs/config.inc.php /var/www/phpmyadmin/

# Start
service nginx start
service mysql restart
service php7.3-fpm start
sleep infinity
# tail -f /dev/null
