#!/bin/bash

awk '{print "export "$0""}' .env > env.txt

source env.txt

ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
NAMEDB=$DBNAME
USER=$MYSQL_USER
USERPASS=$MY_SQL_PASSWORD

apt-get -y install expect


service mysql start

expect -c "
spawn mysql_secure_installation

expect \"Enter current password for root (enter for none):\"
send \"\r\"

expect \"Set root password?\"
send \"y\r\"

expect \"New password:\"
send \"$ROOT_PASSWORD\r\"

expect \"Re-enter new password:\"
send \"$ROOT_PASSWORD\r\"

expect \"Remove anonymous users?\"
send \"y\r\"

expect \"Disallow root login remotely?\"
send \"y\r\"

expect \"Remove test database and access to it?\"
send \"y\r\"

expect \"Reload privilege tables now?\"
send \"y\r\"

expect eof
"

mysql -u root -p

expect -c "
# spawn mysql -u root -p

expect \"Enter password:\"
send \"$ROOT_PASSWORD\r\"

expect \"MariaDB [(none)]>\"
send \"CREATE DATABASE $NAMEDB;\r\"

# expect \"MariaDB [(none)]>\"
# send \"CREATE USER '$USER'@localhost IDENTIFIED BY '$USERPASS';\"

# expect \"MariaDB [(none)]>\"
# send \"GRANT ALL PRIVILEGES ON '$NAMEDB'.* TO '$USER'@localhost;\"

# expect \"MariaDB [(none)]>\"
# send \"FLUSH PRIVILEGES;\"

# expect \"MariaDB [(none)]>\"
# send \"SHOW GRANTS FOR '$USER'@localhost;\"

expect eof
"


