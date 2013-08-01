FROM cybersiddhu/centos6
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'
ADD setup-pg /
RUN mkdir -p /var/lib/pgsql
VOLUME "/var/lib/pgsql"
RUN /run/initpg
CMD /run/runpg
EXPOSE 5432
