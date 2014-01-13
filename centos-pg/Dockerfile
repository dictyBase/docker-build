FROM cybersiddhu/centos-supervisor
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'

RUN mkdir /run /config
ADD setup-pg/run /run
ADD setup-pg/config /config
RUN /run/pginstall

EXPOSE 5432
CMD ["/usr/bin/supervisord","-n", "-c", "/etc/supervisord.conf"]

