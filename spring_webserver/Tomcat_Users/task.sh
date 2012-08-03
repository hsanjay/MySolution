#!/bin/sh

sed -i "s/<\/tomcat\-users>/<role rolename=\"manager\"\/>\n<role rolename=\"manager\-gui\"\/>\n<role rolename=\"admin\"\/>\n<role rolename=\"admin\-gui\"\/>\n<user username=\"tomcat\" password=\"tomcat\" roles=\"admin,admin\-gui,manager,manager\-gui\"\/>\n<\/tomcat-users>/g" $tc_conf_location/tomcat-users.xml