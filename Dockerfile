FROM debian:7.5
MAINTAINER Ewa Czechowska <ewa@ai-traders.com>
# DESCRIPTION "Debian 7.5 with chef-client and berkshelf-api installed"

RUN apt-get update && apt-get install -y nano build-essential libarchive-dev ruby1.9.1 ruby1.9.1-dev
RUN gem install berkshelf-api --no-rdoc --no-ri --version 2.1.1

RUN mkdir /build
COPY . /build # copy contents of . into docker container /build
RUN /build/set_user_berkshelf.sh && /build/cleanup.sh

USER berkshelf

EXPOSE 26200
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["berks-api"]
