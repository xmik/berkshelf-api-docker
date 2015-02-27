FROM debian:7.5
MAINTAINER Ewa Czechowska <ewa@ai-traders.com>

RUN mkdir /scripts
# do not add any comments after ADD or COPY or you get: "no such file or directory"
COPY scripts /scripts 
RUN /scripts/install_berkshelf_api.sh && mv /scripts/image_metadata.txt /etc/docker_image_metadata.txt && /scripts/set_user_berkshelf.sh && /scripts/cleanup.sh

USER berkshelf

EXPOSE 26200
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["berks-api"]
