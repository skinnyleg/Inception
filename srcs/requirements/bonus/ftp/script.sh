#!/bin/bash


FTPUser=ftpuser
FTPpass=ftpuser123


cd /etc/

sed -i 's/listen=NO/listen=YES/g' vsftpd.conf
sed -i 's/listen_ipv6=YES/listen_ipv6=NO/g' vsftpd.conf
sed -i 's/#write_enable=YES/write_enable=YES/g' vsftpd.conf
sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' vsftpd.conf
echo "userlist_deny=NO" >> vsftpd.conf
echo "userlist_enable=YES" >> vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> vsftpd.conf
echo "local_enable=YES" >> vsftpd.conf
echo "allow_writeable_chroot=YES" >> vsftpd.conf
echo "local_root=/home/$FTPUser/" >> vsftpd.conf
echo "pasv_enable=YES" >> vsftpd.conf
echo "pasv_min_port=40000" >> vsftpd.conf
echo "pasv_max_port=40005" >> vsftpd.conf

groupadd $FTPUser

useradd $FTPUser -g $FTPUser

echo "$FTPUser:$FTPpass" | chpasswd

chown $FTPUser:$FTPUser /home/$FTPUser/

echo "$FTPUser" >> /etc/vsftpd.userlist

service vsftpd start 

kill $(cat /var/run/vsftpd/vsftpd.pid)

vsftpd
