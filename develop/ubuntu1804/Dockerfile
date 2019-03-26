FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y dist-upgrade
RUN apt-get -y install apt-file aptitude
RUN apt-get -y update

RUN apt-get -y install build-essential wget git bind9-host bind9-doc curl
RUN apt-get -y install python3 python3-distutils python3-pyodbc mysql-client-5.7 mysql-server-5.7

RUN mkdir -p /root/tmp
WORKDIR /root/tmp

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 /root/tmp/get-pip.py pip

RUN groupadd -g 1000 developer
RUN useradd --gid 1000 --home /home/developer developer
WORKDIR /home/developer
USER developer

