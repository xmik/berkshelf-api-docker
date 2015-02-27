#!/bin/bash

# Run berks-api as berkshelf user. 
sudo su berkshelf -c "export HOME=\"/home/berkshelf\" && berks-api"



# Ensure variables like $HOME are set for this user. 
# sudo -u "berkshelf" -i <<'EOF'
# berks-api
# EOF