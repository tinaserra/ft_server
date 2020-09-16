# Image de base
FROM debian:buster

# Personne qui maintien le Dockerfile
MAINTAINER vserra <vserra@sutdent.42.fr>

# Prerequis
RUN apt-get update
RUN apt-get install -y openssl php-mysql php-fpm mariadb-server wget nginx

# Config Nginx
RUN chown -R www-data /var/www/* \
&& chmod -R 755 /var/www/*

# Certificat SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=tina/CN=localhost"

# Config MySQL
RUN service mysql start \
&& mysql --execute="CREATE USER 'vserra'@'localhost';ALTER USER 'vserra'@'localhost' IDENTIFIED BY '123soleil';GRANT ALL PRIVILEGES ON *.* TO 'vserra'@'localhost';CREATE DATABASE wordpress;"

# Installation Wordpress
RUN wget https://wordpress.org/latest.tar.gz \
&& tar xvf latest.tar.gz \
&& mv wordpress /var/www/wordpress \
&& rm latest.tar.gz

# Installation phpMyAdmin
RUN mkdir -p /var/www/phpmyadmin \
&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar xzf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components=1 -C /var/www/phpmyadmin \
&& rm phpMyAdmin-4.9.0.1-all-languages.tar.gz

# Ajout des sources
ADD srcs/script.sh ./
ADD srcs/default etc/nginx/sites-available
ADD srcs/wp-config.php /var/www/wordpress
ADD srcs/config.inc.php var/www/phpmyadmin
ADD srcs/index.html /var/www/html
ADD srcs/test.php /var/www

EXPOSE 80
EXPOSE 443

CMD bash script.sh