alias be='bundle exec'
alias bi='bundle install'
alias biq='bundle install --quiet'
alias vi='nvim'
alias folder-size='du -s ./* | sort -n | cut -f 2- | xargs -Ix du -sh x'
alias update-vim-plugins='vim +PluginClean! +PluginInstall! +qall'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias fix-audio='sudo killall coreaudiod'
alias fix-cam='sudo killall VDCAssistant'
alias utc='date -u | pbcopy'

function 'del_host' { gsed -i ${1}d ~/.ssh/known_hosts; }
function 'pwhash' { openssl rand -base64 12 }
function 'update-git-repos' { for i in `find . -type d -maxdepth 1` ; do echo "\e[0;36mUpdating $i ...\e[0m" ; cd $i ; git up -q ; cd - ; done }

#git
function git(){hub $@}
alias g='git'

#tmux
alias tml="tmux list-sessions"
alias tma="tmux -2 attach -t $1"
alias tmk="tmux kill-session -t $1"

#ERB
function 'erb_check' { echo -n "\033[1;32m${1}:\033[0m " && erb -P -x -T '-' ${1} | ruby -c; }
alias erb_check_all="for i in *.erb; do echo -n \"\033[1;32m\$i:\033[0m \" && erb -P -x -T '-' \$i | ruby -c; done | column -t"

#Terraform
alias tf='terraform'

#Heroku
alias h='heroku'

# SSH
alias ssh="osascript -e 'if application \"yubiswitch\" is running then tell application \"yubiswitch\" to KeyOn' && ssh"

# AWS
function set_aws_env() {
  local profile=${1:-default}
  export AWS_ACCESS_KEY_ID=`grep -A3 ${profile} ~/.aws/credentials | awk '/aws_access_key_id/ {print $3}'`
  export AWS_SECRET_ACCESS_KEY=`grep -A3 ${profile} ~/.aws/credentials | awk '/aws_secret_access_key/ {print $3}'`
}

function unset_aws_env() {
  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
}

# get my AWS Account ID
function my-aws-account-id() {
  aws --profile=${1:-default} sts get-caller-identity --output text --query 'Account'
}

alias rcc="git diff --name-only master | rg .+rb | xargs bundle exec rubocop"
