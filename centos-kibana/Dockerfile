FROM centos
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'

RUN yum -y install http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm && yum -y install nginx  which
RUN mkdir -p /var/www/kibana3 && curl -o /tmp/kibana.tar.gz https://download.elasticsearch.org/kibana/kibana/kibana-3.0.0milestone4.tar.gz
RUN cd /tmp && tar xvzf kibana.tar.gz && mv /tmp/kibana-3.0.0milestone4/* /var/www/kibana3/ 
ADD kibana.conf /etc/nginx/conf.d/
ADD run.sh /usr/local/bin/run_kibana
RUN chmod +x /usr/local/bin/run_kibana && rm /etc/nginx/conf.d/default.conf && echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 8080
CMD ["/usr/local/bin/run_kibana"]
