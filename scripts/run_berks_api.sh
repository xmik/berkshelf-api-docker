#!/bin/bash


if [ -z "$CHEF_SERVER_ENDPOINT"  ]; then
    # set default
    CHEF_SERVER_ENDPOINT="https://chef_server"
fi

if [ -z "$CHEF_CLIENT_NAME" ]; then
    # set default
    CHEF_CLIENT_NAME="berkshelf"
fi

cat >/home/berkshelf/.berkshelf/api-server/config.json <<EOF
{
  "endpoints": [
    {
      "type": "chef_server",
      "options": {
        "url": "$CHEF_SERVER_ENDPOINT",
        "client_name": "$CHEF_CLIENT_NAME",
        "client_key": "/home/berkshelf/.chef/berkshelf.pem",
  	"ssl_verify": false
      }
    }
  ]
}
EOF

# Run berks-api as berkshelf user. If it fails, let someone in to correct it or find error.
su berkshelf -c "export HOME=\"/home/berkshelf\" && berks-api" || /bin/bash

# Even though this: su berkshelf -c "export HOME=\"/home/berkshelf\" && echo $HOME" prints $HOME as not /home/berkshelf, the $HOME variable is set and will be used by berks-api (or any other script).
