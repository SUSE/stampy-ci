#!/usr/bin/env bash
set -e
PATH=$PATH:$PWD/bin
export GOPATH=$PWD
make -C src/github.com/hpcloud/stampy test
