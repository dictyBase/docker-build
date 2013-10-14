FROM cybersiddhu/centos6
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'

RUN mkdir /run /config
ADD setup-pg/run /run
ADD setup-pg/config /config
RUN /run/pgset

## - This ip is from the default docker0 interface, change it as needed
## - Comment this out if you do not have etcd running in the host
ENV DOCKER_INTERFACE 172.17.42.1

## - The base key to use for registering with etcd
## - Comment out if needed
# ENV REGISTER_DIR_KEY <your-key-name>

## - The key to register docker service
# ENV REGISTER_SERVICE <your-key-name>

ENTRYPOINT ["/run/pgmaster"]
CMD ["-h"]

EXPOSE 5432
