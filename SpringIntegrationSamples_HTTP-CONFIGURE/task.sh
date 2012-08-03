#!/bin/sh

# Import global conf 
. $global_conf

set -e

export M2_HOME=/usr/local/apache-maven-3.0.4
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"

export JAVA_HOME=/usr/java/jdk1.6.0_33

export PATH=$JAVA_HOME/bin:$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$M2
export HOME=/root

cd ~/springworkspace/IntegrationSamples/basic/http

sed -i "s/<\/plugins>/<plugin>\n<groupId>org.codehaus.mojo<\/groupId>\n<artifactId>tomcat-maven-plugin<\/artifactId>\n<configuration>\n<url>http:\/\/$http_host:8080\/manager\/html<\/url>\n<server>\"vFabricTcServer\"<\/server>\n<path>\/http<\/path>\n<\/configuration>\n<\/plugin>\n<\/plugins>/g" pom.xml

find `pwd` -name "*.*" -print | xargs sed -i "s/localhost/$http_host/g"

$M2/mvn clean package

mv target/http-2.1.0.BUILD-SNAPSHOT.war target/http.war

curl -T target/http.war ftp://ftpuser:ftpuser@$http_host