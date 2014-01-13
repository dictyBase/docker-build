FROM tianon/centos
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y update && yum -y install python-pip  && /usr/bin/pip install supervisor
RUN mkdir -p /etc/supervisor/conf.d && mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/
VOLUME /var/log/supervisor
CMD ["/usr/bin/supervisord"]

