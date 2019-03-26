FROM centos:6

RUN yum -y update

RUN yum -y groupinstall "Development Tools"
RUN yum -y install man man-pages-ja wget vim-enhanced git

RUN mkdir -p /root/tmp
WORKDIR /root/tmp

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 /root/tmp/get-pip.py pip

RUN groupadd -g 1000 developer
RUN useradd --gid 1000 --home /home/developer developer
WORKDIR /home/developer
USER developer

