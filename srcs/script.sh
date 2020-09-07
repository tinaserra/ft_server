#! /bin/bash

# Nginx
mv ./default etc/nginx/sites-available
ln -s etc/nginx/sites-available/default etc/nginx/sites-enabled
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#PHPMYADMIN
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages var/www/localhost/phpmyadmin
mv ./config.inc.php var/www/localhost/phpmyadmin
chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/localhost/phpmyadmin
service php7.3-fpm start
echo "GRANT ALL ON *.* TO 'emma'@'localhost' IDENTIFIED BY '123'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

# Start
service nginx start
service mysql start
service php7.3-fpm restart
sleep infinity
# tail -f /dev/null
