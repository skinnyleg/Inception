#!/bin/bash

awk '{print "export "$0""}' .env > env.txt

source env.txt

DB_NAME=$DBNAME
DB_USER=$MYSQL_USER
DB_PASS=$MYSQL_PASSWORD

sed -i 's/database_name_here/'$DB_NAME'/g' wp-config.php

sed -i 's/username_here/'$DB_USER'/g' wp-config.php

sed -i 's/password_here/'$DB_PASS'/g' wp-config.php

service php7.3-fpm start

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/<version>/fpm/pool.d/www.conf

service php7.3-fpm restart

