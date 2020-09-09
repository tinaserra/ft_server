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
# RUN mkdir -p /var/www/localhost/

# Certificat SSL
RUN mkdir /etc/nginx/ssl \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=Tina/CN=localhost"

# Installation Wordpress
RUN cd /tmp/ \
&& wget https://wordpress.org/latest.zip \
&& unzip latest.zip -d /var/www/wordpress
ADD srcs/wp-config.php /var/www/wordpress
# RUN cd /var/www/ \
# && chown -Rv www-data:www-data * \
# && find . -type d -exec chmod 0755 {} \; \
# && find . -type f -exec chmod 0644 {} \; 

# Installation phpMyAdmin
# RUN cd /tmp/
RUN mkdir -p /var/www/phpmyadmin \
&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar xzf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components=1 -C /var/www/phpmyadmin
# RUN cd /tmp/ \
# && wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
# && tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
# && mv phpMyAdmin-4.9.0.1-all-languages /var/www/phpMyAdmin
# RUN chmod 660 /var/www/phpMyAdmin/config.inc.php
# RUN chown -R www-data:www-data /var/www/phpMyAdmin
RUN rm -rf /tmp/*

# Configure MySQL
RUN service mysql start \
&& mysql --execute="CREATE DATABASE wordpress;CREATE USER 'vserra'@'localhost';ALTER USER 'vserra'@'localhost' IDENTIFIED BY '123soleil';GRANT ALL PRIVILEGES ON *.* TO 'vserra'@'localhost';"

# ADD ou COPY -> /host /dest (avec ADD on peut mettre un https:// au lieu du /host)
ADD srcs/config.inc.php var/www/phpmyadmin
ADD srcs/script.sh ./
# ADD srcs/test.php /var/www/html
# ADD srcs/index.html /var/www/html
# ADD srcs/test.php /var/www
# ADD srcs/wp-config.php ÷/var/www/wordpress

EXPOSE 80
EXPOSE 443

CMD bash script.sh