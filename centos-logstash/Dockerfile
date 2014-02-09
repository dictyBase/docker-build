FROM cybersiddhu/centos-jdk
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'

RUN rpm -ivh http://download.elasticsearch.org/logstash/logstash/packages/centos/logstash-1.3.3-1_centos.noarch.rpm
ADD run.sh /usr/local/bin/run_logstash
RUN chmod +x /usr/local/bin/run_logstash
EXPOSE 5544
CMD ["/usr/local/bin/run_logstash"]
