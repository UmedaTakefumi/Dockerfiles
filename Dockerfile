FROM centos:6

USER root

## system update
RUN yum -y update

## install base utils
RUN yum -y groupinstall "Development Tools"
RUN yum -y install man man-pages-ja wget vim-enhanced git

## add Bats(Bash Automated Testing System)
RUN mkdir -p /opt/Software/bats
RUN mkdir -p /root/tmp/
WORKDIR /root/tmp/
RUN git clone https://github.com/sstephenson/bats.git
WORKDIR /root/tmp/bats
RUN ./install.sh /opt/Software/bats
RUN rm -rf /root/tmp/bats/
## see also:
##      https://github.com/sstephenson/bats

## add developer user
RUN groupadd -g 10000 developer
RUN adduser -g 10000 -d /home/developer developer
WORKDIR /home/developer

## config security
USER developer

