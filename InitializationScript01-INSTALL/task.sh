#!/bin/sh

yum --nogpgcheck -y clean all
yum --nogpgcheck -y install curl
yum --nogpgcheck -y install vsftpd
yum --nogpgcheck -y install ftp