#!/bin/sh
# Import global conf 
. $global_conf

set -e

export JAVA_HOME=/usr/java/jdk1.6.0_33

export PATH=$JAVA_HOME/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

export HOME=/root
proxy_host=`echo $http_proxy | sed -e 's_http://__' -e 's/:.*//'`
proxy_port=`echo $http_proxy | sed  -e 's/.*://'`
echo "%_httpproxy $proxy_host" >> ~/.rpmmacros
echo "%_httpport $proxy_port" >> ~/.rpmmacros

#Start checking OS type
echo "NO OS check required."
echo "Apache Maven is released for UNIX-based OS's (Linux, Solaris, ...etc)."

KERNEL=`uname -r`
MACH=`uname -m`
if [ -f /etc/redhat-release ] ; then
   DistroBasedOn='RedHat'
   DIST=`cat /etc/redhat-release |sed s/\ release.*//`
   REV=`cat /etc/redhat-release | sed s/.*release\ // | sed s/\ .*//`
elif [ -f /etc/SuSE-release ] ; then
   DistroBasedOn='SuSe'
   REV=`cat /etc/SuSE-release | tr "\n" ' ' | sed s/.*=\ //`
elif [ -f /etc/debian_version ] ; then
   DistroBasedOn='Debian'
   DIST=`cat /etc/lsb-release | grep '^DISTRIB_ID' | awk -F=  '{ print $2 }'`
   REV=`cat /etc/lsb-release | grep '^DISTRIB_RELEASE' | awk -F=  '{ print $2 }'`
fi

# Tested on CentOS
if [ -x /usr/sbin/selinuxenabled ] && /usr/sbin/selinuxenabled; then
    # SELinux can be disabled by setting "/usr/sbin/setenforce Permissive"
    echo 'SELinux in enabled on this VM template.  This service requires SELinux to be disabled to install successfully'
    exit 1
fi

echo $DistroBasedOn
echo $http_proxy

cd /tmp

wget $mavenURL

tar xzvf $install_tar

mv apache-maven-3.0.4 /usr/local

cd /usr/local

ln -s /usr/local/apache-maven-3.0.4 maven

#End