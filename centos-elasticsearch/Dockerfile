FROM cybersiddhu/centos-jdk
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'

RUN rpm -ivh https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.11.noarch.rpm
EXPOSE 9200 9300
ENTRYPOINT ["/usr/share/elasticsearch/bin/elasticsearch"]
CMD ["-f"]

