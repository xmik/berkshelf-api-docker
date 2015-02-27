FROM debian:7.5
MAINTAINER Ewa Czechowska <ewa@ai-traders.com>

RUN apt-get update && apt-get install -y nano build-essential libarchive-dev ruby1.9.1 ruby1.9.1-dev
RUN gem install berkshelf-api --no-rdoc --no-ri --version 2.1.1

RUN mkdir /scripts
COPY ./scripts /scripts # copy contents of ./scripts into docker container /scripts
RUN mv /scripts/image_metadata.txt /etc/docker_image_metadata.txt && /scripts/set_user_berkshelf.sh && /scripts/cleanup.sh

USER berkshelf

EXPOSE 26200
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["berks-api"]
