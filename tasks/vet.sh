#!/usr/bin/env sh
set -e
GOPATH=$PWD
make -C src/github.com/hpcloud/stampy vet
