#!/bin/bash

# Run berks-api as berkshelf user. If it fails, let someone in to correct it or find error. 
su berkshelf -c "export HOME=\"/home/berkshelf\" && berks-api" || /bin/bash

# Even though this: su berkshelf -c "export HOME=\"/home/berkshelf\" && echo $HOME" prints $HOME as not /home/berkshelf, the $HOME variable is set and will be used by berks-api (or any other script).