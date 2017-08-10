#!/bin/bash

target="$1"

if test -n "${CONCOURSE_SECRETS_FILE:-}"; then
    if test -r "${CONCOURSE_SECRETS_FILE:-}" ; then
        secrets_file="${CONCOURSE_SECRETS_FILE}"
    else
        printf "ERROR: Secrets file %s is not readable\n" "${CONCOURSE_SECRETS_FILE}" >&2
        exit 2
    fi
fi

fly -t "$target" set-pipeline -p stampy-check -c stampy-check.yml \
    -l <(gpg -d --no-tty "${secrets_file}" 2> /dev/null)
