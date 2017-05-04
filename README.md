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

To set-pipeline, ((get secrets from ...))

Then (assuming your instance is called "lol") do a set-pipeline like this:

```bash
./set-master lol
./set-check lol
```

If the secrets are not in the directory `../cloudfoundry/secure`,
i.e. sibling to this CI repository, you can instead use

```bash
./set-master lol /path/to/cloudfoundry/secure
./set-check lol /path/to/cloudfoundry/secure
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
    private_key: {{git-private-key}}
```
