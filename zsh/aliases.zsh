alias g='git'
alias be='bundle exec'
alias vi='vim'
function 'del_host' { gsed -i ${1}d ~/.ssh/known_hosts; }
alias dh='dirs -v'
alias folder-size='du -s ./* | sort -n | cut -f 2- | xargs -Ix du -sh x'
function 'pwhash' { openssl rand -base64 12 }
alias update-vim-plugins='vim +PluginClean! +PluginInstall! +qall'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias b2d='boot2docker'
alias clear-dns='sudo killall -HUP mDNSResponder'
function 'update-git-repos' { for i in `find . -type d -maxdepth 1` ; do echo "\e[0;36mUpdating $i ...\e[0m" ; cd $i ; git up -q ; cd - ; done }
alias fix-cam='sudo killall VDCAssistant'

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
