#!/bin/bash

useradd berkshelf -d /home/berkshelf -s /bin/bash -u 262 --system
mkdir -p /home/berkshelf/.berkshelf/api-server
mkdir -p /home/berkshelf/.chef

# to be configured at container start
touch /home/berkshelf/.berkshelf/api-server/config.json 
# to be configured at container start
touch /home/berkshelf/.chef/berkshelf.pem

mv /scripts/run_berks_api.sh /usr/bin/run_berks_api.sh
chmod 755 /usr/bin/run_berks_api.sh
chown berkshelf:berkshelf -R /home/berkshelf/