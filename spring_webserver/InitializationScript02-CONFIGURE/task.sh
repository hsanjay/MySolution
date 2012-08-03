#!/bin/sh

echo "userlist_deny=NO" >> /etc/vsftpd/vsftpd.conf
echo "ftpuser" >> /etc/vsftpd/user_list

/usr/sbin/useradd -d /var/ftp/pub -s /sbin/nologin ftpuser

echo "ftpuser" | passwd --stdin ftpuser

chown -R ftpuser /var/ftp



