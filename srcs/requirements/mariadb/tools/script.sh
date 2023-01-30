#!/bin/bash

ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
NAMEDB=$DBNAME
USER=$MYSQL_USER
USERPASS=$MYSQL_PASSWORD

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -u root -e "CREATE DATABASE $NAMEDB;"
mysql -u root -e "CREATE USER '$USER'@'%' IDENTIFIED BY '$USERPASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $NAMEDB.* TO '$USER'@'%';"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"
mysql -u root -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld