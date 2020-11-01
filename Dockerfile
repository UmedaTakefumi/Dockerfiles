FROM centos:7

USER root

## system update
RUN yum -y update

## install base utils
RUN yum -y groupinstall "Development Tools"
RUN yum -y install man man-pages-ja wget vim-enhanced git

## add developer user
RUN groupadd -g 10000 developer
RUN adduser -g  10000 -d /home/developer developer
WORKDIR /home/developer

## config security
USER developer



