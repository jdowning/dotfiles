# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"

export EDITOR=vim

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

plugins=(aws brew bundler gem git github osx rbenv ruby vagrant)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Speed up the zsh completion
fpath=(/usr/local/share/zsh-completions $fpath)
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
__git_files () {
    _wanted files expl 'local files' _files
}

# dirs
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome

# color clock on the right
RPROMPT="${FG[117]}%D{%T %Z %m-%d-%Y}%{$reset_color%}"

# rbenv
export RBENV_ROOT=/usr/local/opt/rbenv
export PATH="${HOME}/bin:${RBENV_ROOT}/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
eval "$(rbenv init -)"

# gh cli
eval "$(gh alias -s)"

# AWS
source /usr/local/share/zsh/site-functions/_aws

# Golang
export GOPATH=$HOME/dev/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Docker
#export DOCKER_HOST=tcp://`boot2docker -m 123 ssh ip addr show eth1 |sed -ne 's/^[ \t]*inet[ \t]*\([0-9.]*\)\/.*$/\1/p'`:2375

# NodeJS
export PATH=$PATH:/usr/local/share/npm/bin
