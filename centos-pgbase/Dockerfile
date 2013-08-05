FROM cybersiddhu/centos6
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'
RUN mkdir /run /config
ADD setup-pg/config/CentOS-Base.repo /config/CentOS-Base.repo
ADD setup-pg/run /run
RUN /run/pgset
CMD /run/runpg
EXPOSE 5432
