#!/bin/bash

if [ -z "$CHEF_SERVER_ENDPOINT"  ]; then
    # set default
    CHEF_SERVER_ENDPOINT="https://chef.example.com:443"
fi

if [ -z "$CHEF_CLIENT_NAME" ]; then
    # set default
    CHEF_CLIENT_NAME="berkshelf"
fi

if [ -z "$BERKS_BUILD_INTERVAL" ]; then
    # set default
    BERKS_BUILD_INTERVAL=5
fi

# if CHEF_ORGANIZATION not set, don't do anything, this is ok for Chef Server 11

# build_interval is the interval between last log message and this message:
# Processing chef_server: ...
cat >/home/berkshelf/.berkshelf/api-server/config.json <<EOF
{
  "endpoints": [
    {
      "type": "chef_server",
      "options": {
        "url": "${CHEF_SERVER_ENDPOINT}${CHEF_ORGANIZATION}",
        "client_name": "$CHEF_CLIENT_NAME",
        "client_key": "/home/berkshelf/.chef/berkshelf.pem",
        "ssl_verify": false
      }
    }
  ],
  "build_interval": $BERKS_BUILD_INTERVAL
}
EOF

# Run berks-api as berkshelf user. If it fails, let someone in to correct it or find error.
su berkshelf -c "cd /scripts && export HOME=\"/home/berkshelf\" && bundle exec berks-api" || /bin/bash
