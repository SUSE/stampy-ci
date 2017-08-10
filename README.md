# stampy-ci

The concourse build pipeline for the [stampy](https://github.com/SUSE/stampy) repo.

There are two parts:
- Build (one per branch, only master currently)
- Check (for gating PRs)

The build pipelines each expose the make targets:
- lint
- test
- format
- build/dist

To set-pipeline (assuming your instance is called "lol") use the the
helpers like this:

```bash
export CONCOURSE_SECRETS_FILE=~/workspace/SUSE/cloudfoundry/secure/concourse-secrets.yml.gpg
./set-master lol
./set-check lol
```

## Testing notes

While working on a pipeline, it is useful to point it to a local git
repo to avoid repeated pushes to the remote repo.

- A `git serve` alias can be configured to host any checkout of a git
  repository from your local workstation:

  - `git config --global alias.serve "daemon --verbose --export-all
    --base-path=.git --reuseaddr --strict-paths .git/"`

- Then this can be used to serve the local `stampy-ci`.

  - `cd /path/to/stampy-ci && git serve`

- The pipeline files can then be modified to point to your local IP

```
- name: src-ci
  type: git
  source:
    uri: git://192.168.1.1/
    branch: master
    private_key: {{github-private-key}}
```
