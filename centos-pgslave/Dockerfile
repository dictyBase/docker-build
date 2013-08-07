FROM cybersiddhu/centos6-pgbase
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'

RUN yum -y --exclude=upstart\* update
RUN yum -y --exclude=upstart\* upgrade

RUN if [-e "/run" ]; then rm -rf /run; fi 
RUN if [-e "/config" ]; then rm -rf /config; fi 

ADD setup-pg /
ENTRYPOINT ["/run/pgslave"]
CMD ["-h"]

EXPOSE 5432
