FROM debian:7.5
MAINTAINER Ewa Czechowska <ewa@ai-traders.com>

RUN mkdir /scripts
# do not add any comments after ADD or COPY or you get: "no such file or directory"
COPY scripts /scripts 
RUN /scripts/install_berkshelf_api.sh && mv /scripts/image_metadata.txt /etc/docker_image_metadata.txt && /scripts/set_user_berkshelf.sh && /scripts/cleanup.sh


EXPOSE 26200
ENTRYPOINT ["/bin/bash", "-c"]
# Run as user: berkshelf but still enable logging as root to a running
# container with "docker exec", thus do not add: "USER berkshelf".
CMD ["/usr/bin/run_berks_api.sh"]
