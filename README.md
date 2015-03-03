# berkshelf-api-docker 

Debian 7.5 with berkshelf-api 2.1.1. Tested with images: [debian:7.5](https://registry.hub.docker.com/u/library/debian/) and [xmik/chef-server-docker](https://github.com/xmik/chef-server-docker) images.

## Usage

* Optionally set CHEF_SERVER_ENDPOINT. The default is: "https://chef_server", so if you run the container linking it to the chef server container (--link chef_server:chef_server), you don't have to set this variable. This endpoint must be available for chef workstation to run `berks install` or `berks upload`. To change it while a container is running edit /usr/bin/run_berks_api.sh and restart the container.
* Mount the berkshelf.pem file (berkshelf is the chef server user here). 

### Examples
```bash
docker run -dti --name berkshelf_api -v /path/to/berkshelf.pem:/home/berkshelf/.chef/berkshelf.pem -e CHEF_SERVER_ENDPOINT=https://10.0.0.18:443 -p 26200:26200  berkshelf_api:0.0.2
```

or using the default chef server endpoint:
```bash
docker run -dti --name berkshelf_api -v /path/to/berkshelf.pem:/home/berkshelf/.chef/berkshelf.pem -p 26200:26200 --link chef_server:chef_server berkshelf_api
```

To confirm that you have connected to berks-api server, search for some cookbook in your chef server, e.g. apt:
```bash
user@host:~$ berks search apt --source http://[container_ip]:26200
apt (2.6.1)
```

## Warning
If in chef server there is both: a user and a client named berkshelf, you'll most probably get Permission denied when authorizing as berkshelf. 

## Build
Build an image using the tag from script/image_metadata.txt. Use rake task:
```ruby
rake berkshelf_api:build
```

Size of [berkshelf_api:0.0.2](https://registry.hub.docker.com/u/xmik/berkshelf_api/) is 296.8 MB.

## TODO
* Abandon berks-api logs older than 1 day

## How it is done

First some debian packages are installed (like: nano build-essential libarchive-dev ruby1.9.1 ruby1.9.1-dev), then the gem: berkshelf-api 2.1.1.

Then a linux user: berkshelf is created and configured. 

The script that will be ran at container start is /usr/bin/run_berks_api.sh. It runs berks-api as berkshelf user, ensures its HOME is set and sets /home/berkshelf/.berkshelf/api-server/config.json using CHEF_SERVER_ENDPOINT variable. 