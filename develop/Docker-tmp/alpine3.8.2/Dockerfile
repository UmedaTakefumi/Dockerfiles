FROM alpine:3.8
RUN apk --update add bash \
  && rm -rf /var/cache/apk/*

RUN adduser -S umetake
RUN addgroup -S umetake
RUN addgroup umetake umetake


# docker run -v  $(pwd)/docker-workdir:/home/umetake -it alpine3.8.2 /bin/bash 01.sh
WORKDIR /home/umetake
USER umetake

VOLUME ["/home/umetake"] 
