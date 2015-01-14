# Bash Completion for nuxeoctl 

This project contains a bash completion scrifor nuxeoctl

# How does this work? 

This completion script will resolve all package id's for you, depending on the given command. 

* For expanding the `mp-install` command, it will download all available packages from the Nuxeo Marketplace. For each shell in which the command is run, it will create a file cache to speed up subsequent calls. The initial call is slow, but the rest uses the cache (stored in `${HOME}/.nuxeo_bash_completion_cache.${PID}`). 

* For `mp-uninstall` it will query the currently downloaded/installed packages, using `mp-list`

# Dependencies

* jq - http://stedolan.github.io/jq/download/ 

# Installation

## General

```
sudo wget https://raw.github.com/aukjan/nuxeoctl-bash-completion/master/etc/bash_completion.d/nuxeoctl-bash-completion.bash -O /etc/bash_completion.d/nuxeoctl-bash-completion.bash
```

or

```
git clone https://github.com/aukjan/nuxeoctl-bash-completion.git
cd nuxeoctl-bash-completion
make install
```


## OS X - Homebrew

This depends on having bash-completion already present and setup:

````
brew install git bash-completion
brew install jq # optional dependency.
````

Now tap the completions, and install the forumla

```
brew tap aukjan/completions
brew install nuxeoctl-completion
```
