#!/usr/bin/env sh
set -e
PATH=$PATH:$PWD/bin
export GOPATH=$PWD
make -C src/github.com/hpcloud/stampy build
cp -r src/github.com/hpcloud/stampy/build/* build/
