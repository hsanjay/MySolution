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

sleep 10

$M2/mvn exec:java