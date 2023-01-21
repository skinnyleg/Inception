#!/bin/bash

awk '{print "export "$0""}' .env > env.txt

source env.txt

ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
NAMEDB=$DBNAME
USER=$MYSQL_USER
USERPASS=$MYSQL_PASSWORD

apt-get -y install expect

# service mysql start

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql restart

mysql -u root -e "CREATE DATABASE $NAMEDB;"
mysql -u root -e "CREATE USER '$USER'@localhost IDENTIFIED BY '$USERPASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $NAMEDB.* TO '$USER'@localhost;"
mysql -u root -e "FLUSH PRIVILEGES;"
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"

# expect -c "
# spawn mysql_secure_installation

# expect \"Enter current password for root (enter for none):\"
# send \"$ROOT_PASSWORD\r\"

# expect \"Change the root password\"
# send \"n\r\"

# expect \"Remove anonymous users?\"
# send \"y\r\"

# expect \"Disallow root login remotely?\"
# send \"y\r\"

# expect \"Remove test database and access to it?\"
# send \"y\r\"

# expect \"Reload privilege tables now?\"
# send \"y\r\"

# expect eof
# "
