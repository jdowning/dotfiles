set -U EDITOR vim
set -U fish_greeting ''

set -x PATH /usr/local/bin /usr/local/sbin $PATH
set -x AWS_CONFIG_FILE $HOME/.aws/config

# rbenv
set -x RBENV_ROOT /usr/local/opt/rbenv
set -x PATH $RBENV_ROOT/bin $PATH
source (rbenv init -|psub)
#. (rbenv init -|psub)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showcolorhints ' '
set __fish_git_prompt_char_dirtystate '✘'
set __fish_git_prompt_color cyan
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_cleanstate green
set fish_prompt_color cyan
set fish_git_dirty_color red
set fish_git_not_dirty_color green

function fish_prompt
  set_color $fish_prompt_color
  printf '%s%s%s' (prompt_pwd) (__fish_git_prompt) ' ᐅ '
  set_color normal
end

function fish_right_prompt
  set_color $fish_prompt_color
  date "+%H:%M:%S %Z %m-%d-%y"
  set_color normal
end

function del_host 
  gsed -i $argv[1]d ~/.ssh/known_hosts
end

# aliases
alias be='bundle exec'
alias mvim='open -a macvim'
alias dh='dirs -v'
alias folder-size='du -s ./* | sort -n | cut -f 2- | xargs -Ix du -sh x'
alias pwhash='openssl passwd -1 -salt (openssl rand -base64 12)'
alias update-vim-plugins='cd $HOME ; and git submodule foreach git pull origin master'

##DNS
alias dns-normal='sudo networksetup -setdnsservers Wi-Fi 192.168.5.1'
alias dns-google='sudo networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4'

##hub
alias git=hub

##Puppet
alias pd='cd ~/dev/atm/puppet'

##Vagrant
alias v=vagrant
alias vkill='vagrant destroy -f'
