FROM alpine:3.8

USER root
# --------------------------------------------------------------------------------
# basic installation
# --------------------------------------------------------------------------------
RUN apk add --update-cache && rm -rf /var/cache/apk/*
RUN apk add vim openssh-client git gcc g++ make gfortran openblas-dev wget

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

## machine learning and Statistical Data Analysis library
RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install dask
RUN pip3 install sklearn

## see also:
## 	https://colab.research.google.com/notebooks/welcome.ipynb
##	https://colab.research.google.com/notebooks/gpu.ipynb
##	https://colab.research.google.com/notebooks/tpu.ipynb

# --------------------------------------------------------------------------------
# perl-script development environment
# --------------------------------------------------------------------------------

RUN apk add perl

# --------------------------------------------------------------------------------
# golang-script development environment
# --------------------------------------------------------------------------------

RUN apk add go

# --------------------------------------------------------------------------------
# ruby-script development environment
# --------------------------------------------------------------------------------

RUN apk add ruby

# --------------------------------------------------------------------------------
# config security
# --------------------------------------------------------------------------------
USER developer

