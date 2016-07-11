source `brew --prefix`/share/antigen.zsh

antigen bundle --loc=lib
#antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundles <<BUNDLES
  aws
  brew
  brew-cask
  bundler
  docker
  gem
  git
  osx
  ruby
  terraform
  vagrant
  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting
  rupa/z
  horosgrisa/autoenv
BUNDLES

antigen theme muse

antigen apply
