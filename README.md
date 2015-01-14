# Bash Completion for nuxeoctl 

This project contains a bash completion scrifor nuxeoctl

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

## Make


