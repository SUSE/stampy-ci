#!/usr/bin/env sh
set -e
PATH=$PATH:$PWD/bin
GOPATH=$PWD
mkdir -p src/github.com/hpcloud/stampy/build
cp -r build/* src/github.com/hpcloud/stampy/build/
make -C src/github.com/hpcloud/stampy dist
cp src/github.com/hpcloud/stampy/*.tgz stampy/
