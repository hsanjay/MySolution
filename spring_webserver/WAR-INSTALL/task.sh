#!/bin/sh

env > /tmp/env.txt

# Stop the application server. This parameter should point to the script used to stop the application server.
cd $service_stop
./tcruntime-ctl.sh  instance1 stop

# Ensure that webapps_dir property is assigned to the application server webapps_dir property.
cp $war_file $webapps_dir

# Start the application server. This parameter should point to the script used to start the application server.
cd $service_start
./tcruntime-ctl.sh instance1 start

            