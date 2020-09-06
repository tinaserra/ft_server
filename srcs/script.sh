#! /bin/bash

# #CERTIFICAT SSL
# mkdir /etc/nginx/ssl
# openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=emma/CN=localhost"

service nginx start
service mysql start
service php7.3-fpm start
tail -f /dev/null

echo "Le temps est bon, le ciel est bleu !"
