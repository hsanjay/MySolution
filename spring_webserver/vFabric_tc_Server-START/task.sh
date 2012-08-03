#!/bin/bash
# Import global conf 
. $global_conf

set -e

#To support ubuntu java bins
export PATH=$PATH:/usr/java/jre-vmware/bin


if [ -f /usr/java/jre-vmware/bin/java ]; then
    export JAVA_HOME=/usr/java/jre-vmware
else
    export JAVA_HOME=/usr
fi


if [ "$automatically_start" == "YES" ]; then
    # Start instance if one exists
    if [ -d $install_path/working/springsource-tc-server-standard/$instance_name/bin ]; then
        cd $install_path/working/springsource-tc-server-standard/$instance_name/bin
        ./tcruntime-ctl.sh start
    fi
else
    echo "Skipping startup"
fi

            