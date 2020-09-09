# Image de base
FROM debian:buster

# Personne qui maintien le Dockerfile
MAINTAINER vserra <vserra@sutdent.42.fr>

# Prerequis
RUN apt-get update
RUN apt-get install -y openssl
RUN apt-get install -y mariadb-server wget nginx unzip
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
# RUN apt-get install -y php-mysql php-fpm mariadb-server wget nginx unzip

# Configure Nginx
RUN chown -R www-data /var/www/* \
&& chmod -R 755 /var/www/*

# Certificat SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=tina/CN=localhost"

# Configure MySQL
RUN service mysql start \
&& mysql --execute="CREATE USER 'vserra'@'localhost';ALTER USER 'vserra'@'localhost' IDENTIFIED BY '123soleil';GRANT ALL PRIVILEGES ON *.* TO 'vserra'@'localhost';CREATE DATABASE wordpress;"

# Installation Wordpress
# RUN cd /tmp/ \
# && wget https://wordpress.org/latest.zip \
# && unzip latest.zip -d /var/www/wordpress
# ADD srcs/wp-config.php /var/www/wordpress
# RUN cd /var/www/ \
# RUN chown -Rv www-data: /var/www/ \
# && rm -rf /tmp/*

# RUN mkdir -p /var/www/wordpress \
# RUN cd /tmp/ \
RUN wget https://wordpress.org/latest.tar.gz \
&& tar xvf latest.tar.gz \
&& mv wordpress /var/www/wordpress \
&& rm latest.tar.gz
ADD srcs/wp-config.php /var/www/wordpress

# Installation phpMyAdmin
RUN mkdir -p /var/www/phpmyadmin \
&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar xzf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components=1 -C /var/www/phpmyadmin
ADD srcs/config.inc.php var/www/phpmyadmin

# RUN cd /tmp/ \
# && wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
# && tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
# && mv phpMyAdmin-4.9.0.1-all-languages /var/www/phpMyAdmin
# ADD srcs/config.inc.php var/www/phpMyAdmin
# RUN chmod 660 /var/www/phpMyAdmin/config.inc.php
# RUN chown -R www-data:www-data /var/www/phpMyAdmin
# RUN rm -rf /tmp/*


# ADD ou COPY -> /host /dest (avec ADD on peut mettre un https:// au lieu du /host)
ADD srcs/script.sh ./
ADD srcs/default etc/nginx/sites-available
ADD srcs/index.html /var/www/html
# ADD srcs/wp-config.php /var/www/wordpress
ADD srcs/test.php /var/www
# ADD srcs/test.php /var/www/html

EXPOSE 80
EXPOSE 443

CMD bash script.sh