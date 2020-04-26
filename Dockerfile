# bash-script for development environment
FROM centos:5

USER root

## setting yum repo
RUN rm -v /etc/yum.repos.d/CentOS-Vault.repo
RUN rm -v /etc/yum.repos.d/CentOS-Base.repo
#RUN rm -v /etc/yum/repos.d/libselinux.repo
COPY CentOS-Base.repo /etc/yum.repos.d/
COPY libselinux.repo  /etc/yum.repos.d/

## system update
RUN yum -y update
## attention:
##      Maintenance updates: 31 March 2017
##      Full updates: 31 January 2014 
##      Release date: 12 April 2007

## install base utils
RUN yum -y groupinstall "Development Tools"
RUN yum -y install man man-pages-ja wget vim-enhanced
RUN yum -y install epel-release
RUN yum -y --enablerepo=epel install git

## add Bats(Bash Automated Testing System)
RUN mkdir -p /opt/Software/bats
RUN mkdir -p /root/tmp/bats
COPY tmp/bats /root/tmp/bats/
WORKDIR /root/tmp/bats/
RUN ./install.sh /opt/Software/bats
RUN rm -rf /root/tmp/bats/
## attention:
##      tlsv1 alert protocol version while accessing 
##      https://github.com/sstephenson/bats/info/refs?service=git-upload-pack
## 
## see also:
##      https://github.com/sstephenson/bats

## あとで修正...
WORKDIR /root

## add developer user
RUN groupadd -g 10000 developer
RUN adduser -g 10000 -d /home/developer developer
WORKDIR /home/developer

## config security
USER developer