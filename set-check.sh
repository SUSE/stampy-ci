#!/bin/bash

target="$1"
secdir="${2:-../cloudfoundry/secure}"

fly -t "$target" set-pipeline -p stampy-check -c stampy-check.yml \
    -l <(gpg -d --no-tty "${secdir}/concourse-secrets.yml.gpg" \
         2> /dev/null)
