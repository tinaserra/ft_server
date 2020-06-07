# Image de base
FROM debian:buster

# Personne qui maintien le Dockerfile
MAINTAINER vserra <vserra@sutdent.42.fr>

# Prerequis ## php-cli php-mbstring
RUN apt-get update
RUN apt-get -y install wget nginx unzip
RUN apt-get -y install php7.3 php-mysql php-fpm mariadb-server

# Installation wordpress
RUN cd /tmp/ \
&& wget https://wordpress.org/latest.zip \
&& unzip latest.zip -d /var/www/wordpress \
&& cd /var/www/ \
&& chown -Rv www-data:www-data * \
&& find . -type d -exec chmod 0755 {} \; \
&& find . -type f -exec chmod 0644 {} \; 

# Installation phpMyAdmin
RUN cd /tmp/ \
&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.0.1-all-languages /var/www/phpMyAdmin \
&& chown -Rv www-data:www-data /var/www/phpMyAdmin
RUN rm -rf /tmp/*

# Configure MySQL
RUN service mysql start \
&& mysql --execute="CREATE DATABASE wordpress;CREATE USER 'vserra'@'localhost';ALTER USER 'vserra'@'localhost' IDENTIFIED BY '123soleil';GRANT ALL PRIVILEGES ON *.* TO 'vserra'@'localhost';"

# ADD ou COPY -> /host /dest (avec ADD on peut mettre un https:// au lieu du /host)
ADD script.sh /usr/bin/script.sh

RUN chmod +x /usr/bin/script.sh

CMD ["script.sh"]