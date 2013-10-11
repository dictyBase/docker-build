FROM cybersiddhu/centos6
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'

RUN mkdir /run /config
ADD setup-pg/run /run
ADD setup-pg/config /config
RUN /run/pgset

ENTRYPOINT ["/run/pgmaster"]
CMD ["-h"]

EXPOSE 5432
