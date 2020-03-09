alias g='git'
alias git='hub'
alias be='bundle exec'
alias bi='bundle install'
alias biq='bundle install --quiet'
alias vi='vim'
alias dh='dirs -v'
alias folder-size='du -s ./* | sort -n | cut -f 2- | xargs -Ix du -sh x'
alias update-vim-plugins='vim +PluginClean! +PluginInstall! +qall'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias fix-audio='sudo killall coreaudiod'
alias fix-cam='sudo killall VDCAssistant'
alias dm='docker-machine'
alias update-node-definitions='node /opt/boxen/node-build/tools/scraper.js'
alias utc='date -u | pbcopy'

function 'del_host' { gsed -i ${1}d ~/.ssh/known_hosts; }
function 'pwhash' { openssl rand -base64 12 }
function 'update-git-repos' { for i in `find . -type d -maxdepth 1` ; do echo "\e[0;36mUpdating $i ...\e[0m" ; cd $i ; git up -q ; cd - ; done }

# InfluxDB
function 'list-series' {
  curl -s "localhost:8086/db/$1/series?u=root&p=root&q=list+series" | \
    python -mjson.tool | \
    grep $2 | \
    sed -E 's/(\"|,| )//g' | \
    sort
}

#Puppet
alias pd='cd ~/dev/atm/puppet'
alias puppet='nocorrect puppet'

#tmux
alias tml="tmux list-sessions"
alias tma="tmux -2 attach -t $1"
alias tmk="tmux kill-session -t $1"

#Vagrant
alias vagrant='nocorrect vagrant'
alias v='nocorrect vagrant'
alias vkill='nocorrect vagrant destroy -f'
alias ve='nocorrect vagrant exec'

#ERB
function 'erb_check' { echo -n "\033[1;32m${1}:\033[0m " && erb -P -x -T '-' ${1} | ruby -c; }
alias erb_check_all="for i in *.erb; do echo -n \"\033[1;32m\$i:\033[0m \" && erb -P -x -T '-' \$i | ruby -c; done | column -t"

#DNS
alias dns-normal='sudo networksetup -setdnsservers Wi-Fi 192.168.5.1'
alias dns-google='sudo networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4'

#Terraform
alias tf='terraform'

#Hub
alias git='hub'

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

#fancy-ctrl-z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#OSX flush_dns
case "$(sw_vers -productVersion)" in
10.5.*|10.6.*)
  alias flush_dns="sudo dscacheutil -flushcache"
  ;;
10.8.*|10.7.*)
  alias flush_dns="sudo killall -HUP mDNSResponder"
  ;;
10.9.*)
  alias flush_dns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
  ;;
10.10.[123])
  alias flush_dns="sudo discoveryutil udnsflushcaches"
  ;;
10.10.*)
  alias flush_dns="sudo killall -HUP mDNSResponder"
  ;;
esac

# get my AWS Account ID
function my-aws-account-id() {
  aws --profile=${1:-default} sts get-caller-identity --output text --query 'Account'
}
