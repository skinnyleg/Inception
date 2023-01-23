#!/bin/bash

awk '{print "export "$0""}' .env > env.txt

source env.txt

DB_NAME=$DBNAME
DB_USER=$MYSQL_USER
DB_PASS=$MYSQL_PASSWORD

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

wp core download --allow-root

cp wp-config-sample.php wp-config.php

wp config set DB_HOST mariadb --type=constant --allow-root

wp config set DB_NAME $DBNAME --type=constant --allow-root

wp config set DB_USER $MYSQL_USER --type=constant --allow-root

wp config set DB_PASSWORD $MYSQL_PASSWORD --type=constant --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php