#!/usr/bin/env sh
set -e
PATH=$PATH:$PWD/bin
GOPATH=$PWD
mkdir -p src/github.com/SUSE/stampy/build
cp -r build/* src/github.com/SUSE/stampy/build/
make -C src/github.com/SUSE/stampy dist
cp src/github.com/SUSE/stampy/*.tgz stampy/
