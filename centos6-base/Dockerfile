FROM centos:latest
MAINTAINER 'Siddhartha Basu<biosidd@gmail.com>'
RUN rpm -ivh http://apt.sw.be/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm 
ONBUILD RUN yum -y update && yum -y upgrade && \
            yum -y install sudo which man curl make 


