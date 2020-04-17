#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-mochapay/mochad-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/mochad docker/bin/
cp $BUILD_DIR/src/mocha-cli docker/bin/
cp $BUILD_DIR/src/mocha-tx docker/bin/
strip docker/bin/mochad
strip docker/bin/mocha-cli
strip docker/bin/mocha-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
