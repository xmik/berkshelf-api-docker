# Berkshelf-API Docker image

Debian 7.5 with berkshelf-api 2.1.1. 

## Usage

Set the environment variable CHEF_SERVER_ENDPOINT and mount the berkshelf.pem file (berkshelf is the chef server client here). By default CHEF_SERVER_ENDPOINT="chef_server".

### Example:
```bash
docker run -dti --name berkshelf_api -v /path/to/berkshelf.pem:/home/berkshelf/.chef/berkshelf.pem -e CHEF_SERVER_ENDPOINT=chef_server -p 26200:26200 berkshelf_api
```

or using the default chef server endpoint:
```bash
docker run -dti --name berkshelf_api -v /path/to/berkshelf.pem:/home/berkshelf/.chef/berkshelf.pem -p 26200:26200 berkshelf_api
```

A good idea is to link berkshelf_api container to a container with chef server with this option: 
```bash
--link chef_server:chef_server
```