# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler cap git osx ruby vagrant)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases
export EDITOR=vim

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
export PATH="/usr/local/opt/rbenv/bin:/usr/local/go/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
eval "$(rbenv init -)"

# hub
export FPATH=$FPATH:/usr/local/share/zsh/site-functions
eval "$(hub alias -s)"

# AWS
source /usr/local/bin/aws_zsh_completer.sh
export AWS_CONFIG_FILE=$HOME/.aws/config
export AWS_CREDENTIAL_FILE="$HOME/.aws/aws-credentials-master"
export AWS_ACCESS_KEY_ID=$(grep '^AWSAccessKeyId' "$AWS_CREDENTIAL_FILE" | cut -d= -f2)
export AWS_SECRET_ACCESS_KEY=$(grep '^AWSSecretKey'   "$AWS_CREDENTIAL_FILE" | cut -d= -f2)
export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home"
