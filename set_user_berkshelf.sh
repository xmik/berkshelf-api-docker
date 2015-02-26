#!/bin/bash

useradd berkshelf -d /home/berkshelf -s /bin/bash -u 262 --system
mkdir -p /home/berkshelf/.berkshelf/api-server
mkdir -p /home/berkshelf/.chef
mv /build/config.json /home/berkshelf/.berkshelf/api-server/config.json
echo $BERKSHELF_PEM > /home/berkshelf/.chef/berkshelf.pem
chown berkshelf:berkshelf -R /home/berkshelf/