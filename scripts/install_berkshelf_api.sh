#!/bin/bash

apt-get update 
DEBIAN_FRONTEND=noninteractive apt-get install -y nano build-essential libarchive-dev ruby1.9.1 ruby1.9.1-dev # https://github.com/docker/docker/issues/4032

gem install berkshelf-api --no-rdoc --no-ri --version 2.1.1