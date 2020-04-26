FROM alpine:3.8

USER root
# --------------------------------------------------------------------------------
# basic installation
# --------------------------------------------------------------------------------
RUN apk add --update-cache && rm -rf /var/cache/apk/*
RUN apk add vim openssh-client git gcc g++ make gfortran openblas-dev wget \
	    screen tmux

## see also:
##	https://pkgs.alpinelinux.org/packages

# --------------------------------------------------------------------------------
# add developer user
# --------------------------------------------------------------------------------

RUN adduser -S developer
RUN addgroup -S developer
RUN addgroup developer developer
WORKDIR /home/developer
## docker run -v  $(pwd)/docker-workdir:/home/developer -it alpine3.8-noscratch /bin/bash
VOLUME ["/home/developer"] 

# --------------------------------------------------------------------------------
# python-script development environment
# --------------------------------------------------------------------------------

RUN apk add python3 python3-dev

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools

# --------------------------------------------------------------------------------
# perl-script development environment
# --------------------------------------------------------------------------------

RUN apk add perl

# --------------------------------------------------------------------------------
# php-script development environment
# --------------------------------------------------------------------------------

RUN apk add php

# --------------------------------------------------------------------------------
# golang-script development environment
# --------------------------------------------------------------------------------

RUN apk add go

# --------------------------------------------------------------------------------
# ruby-script development environment
# --------------------------------------------------------------------------------

RUN apk add ruby

# --------------------------------------------------------------------------------
# bash-script development environment
# --------------------------------------------------------------------------------

RUN apk add bash bats

RUN mkdir -p /opt/Software/busybox
RUN mkdir -p /root/tmp/busybox
RUN wget -O /root/tmp/busybox/busybox-x86_64 \
		https://busybox.net/downloads/binaries/1.28.1-defconfig-multiarch/busybox-x86_64
RUN chmod +x /root/tmp/busybox/busybox-x86_64
RUN /root/tmp/busybox/busybox-x86_64 --install /opt/Software/busybox

# --------------------------------------------------------------------------------
# config security
# --------------------------------------------------------------------------------
USER developer

