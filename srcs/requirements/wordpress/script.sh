#!/bin/bash

DB_NAME=$DBNAME
DB_USER=$MYSQL_USER
DB_PASS=$MYSQL_PASSWORD

service php7.3-fpm restart

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html

rm -rf *

wp core download --allow-root

cp wp-config-sample.php wp-config.php

wp config set DB_HOST mariadb --type=constant --allow-root

wp config set DB_NAME $DBNAME --type=constant --allow-root

wp config set DB_USER $MYSQL_USER --type=constant --allow-root

wp config set DB_PASSWORD $MYSQL_PASSWORD --type=constant --allow-root

wp core install --url=localhost --title="My WordPress Site" --admin_user=skinnyleg --admin_password=haitam123 --admin_email=haitam123@gmail.com --skip-email --allow-root

wp user create med-doba med-doba123@gmail.com --role=subscriber --user_pass=med-doba123 --allow-root

head -n 70 wp-config.php > placeholder.txt

echo "define('WP_REDIS_HOST', 'redis');" >> placeholder.txt

tail -n +71 wp-config.php >> placeholder.txt

cat placeholder.txt > wp-config.php

rm placeholder.txt

wp plugin install redis-cache --allow-root

wp plugin activate redis-cache --allow-root

wp redis enable --allow-root

/usr/sbin/php-fpm7.3 -F