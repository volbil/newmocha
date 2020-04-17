FROM debian:stretch
LABEL maintainer="Mocha Developers <dev@mocha.org>"
LABEL description="Dockerised MochaCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
