## Changelog of berkshelf-api-docker

### 0.0.4 (26 November 2015)

* support Chef Server 12 (introduced `CHEF_ORGANIZATION` environment variable)
* make this image docker-buildable again (#2)
* use different base image (ruby:2.2.3-slim), so that ruby is already installed
* install berkshelf-api by `bundle install` using always same Gemfile.lock and
 also run it with `bundle exec`
* add test directory to make testing a little bit easier

### 0.0.3 (30 October 2015)

* PR #1: Make berkshelf client_name property configurable at runtime --
 thanks to [lgustafson](https://github.com/lgustafson)

### 0.0.2 (March 2015)

### 0.0.1

Initial release.
