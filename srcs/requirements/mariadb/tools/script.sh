#!/bin/bash

awk '{print "export "$0""}' .env > env.txt

source env.txt

ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
NAMEDB=$DBNAME
USER=$MYSQL_USER
USERPASS=$MYSQL_PASSWORD

# apt-get -y install expect

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -u root -e "CREATE DATABASE $NAMEDB;"
mysql -u root -e "CREATE USER '$USER'@'%' IDENTIFIED BY '$USERPASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $NAMEDB.* TO '$USER'@'%';"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"
mysql -u root -e "FLUSH PRIVILEGES;"

service mysql stop

service mysql start
# service mysql start

# echo "CREATE DATABASE IF NOT EXISTS $NAMEDB ;" > db1.sql
# echo "CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$USERPASS' ;" >> db1.sql
# echo "GRANT ALL PRIVILEGES ON $NAMEDB.* TO '$USER'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD' ;" >> db1.sql
# echo "FLUSH PRIVILEGES;" >> db1.sql

# mysql < db1.sql

# service mysql restart
# service mysql stop

# mysqld


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