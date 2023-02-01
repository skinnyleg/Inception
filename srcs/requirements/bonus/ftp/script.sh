#!/bin/bash


FTPUser=ftpuser
FTPpass=ftpuser123


cd /etc/

sed -i 's/listen=NO/listen=YES/g' vsftpd.conf
sed -i 's/listen_ipv6=YES/listen_ipv6=NO/g' vsftpd.conf
sed -i 's/#write_enable=YES/write_enable=YES/g' vsftpd.conf
sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' vsftpd.conf
echo "listen_address=0.0.0.0" >> vsftpd.conf
echo "userlist_deny=NO" >> vsftpd.conf
echo "userlist_enable=YES" >> vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> vsftpd.conf

useradd -N $FTPUser

echo "$FTPUser:$FTPpass" | passwd

chown $FTPUser:$FTPUser /var/www/html

echo "$FTPUser" >> /etc/vsftpd.userlist

service vsftpd start 

kill $(cat /var/run/vsftpd/vsftpd.pid)

vsftpd
