#!/bin/bash

useradd berkshelf -d /home/berkshelf -s /bin/bash -u 262 --system
mkdir -p /home/berkshelf/.berkshelf/api-server
mkdir -p /home/berkshelf/.chef

touch /home/berkshelf/.berkshelf/api-server/config.json 
if [ -z "$CHEF_SERVER_ENDPOINT"  ]; then 
    # set default
    CHEF_SERVER_ENDPOINT="chef_server"
fi

cat >/home/berkshelf/.berkshelf/api-server/config.json <<EOF
EOF-
{
  "endpoints": [
    {
      "type": "chef_server",
      "options": {
        "url": "https://$CHEF_SERVER_ENDPOINT",
        "client_name": "berkshelf",
        "client_key": "/home/berkshelf/.chef/berkshelf.pem",
  	"ssl_verify": false
      }
    } 
  ]
}
EOF

touch /home/berkshelf/.chef/berkshelf.pem
chown berkshelf:berkshelf -R /home/berkshelf/