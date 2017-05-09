#!/usr/bin/env sh
set -e
PATH=$PATH:$PWD/bin
export GOPATH=$PWD
make -C src/github.com/SUSE/stampy build
cp -r src/github.com/SUSE/stampy/build/* build/
