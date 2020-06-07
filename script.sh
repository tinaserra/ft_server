#! /bin/bash

service nginx restart
service mysql restart
service php7.3-fpm start
tail -f /dev/null

echo "Le temps est bon, le ciel est bleu !"
