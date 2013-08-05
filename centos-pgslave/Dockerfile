FROM cybersiddhu/centos6-pgbase
MAINTAINER 'Siddhartha Basu<sidd.basu@gmail.com>'
RUN if [-e "/run" ]; then rm -rf /run; fi 
RUN if [-e "/config" ]; then rm -rf /config; fi 
ADD setup-pg /
CMD /run/runpg
EXPOSE 5432
