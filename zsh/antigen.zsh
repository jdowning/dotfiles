source `brew --prefix`/share/antigen/antigen.zsh

antigen bundle --loc=lib

antigen bundles <<BUNDLES
  aws
  brew
  bundler
  docker
  gem
  git
  ruby
  terraform
  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting
  rupa/z
  horosgrisa/autoenv
BUNDLES

antigen theme miloshadzic

antigen apply
