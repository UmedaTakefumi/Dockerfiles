FROM alpine:3.8
RUN apk --update add bash \
  && rm -rf /var/cache/apk/*

RUN adduser -S umetake
RUN addgroup -S umetake
RUN addgroup umetake umetake

WORKDIR /home/umetake
USER umetake
