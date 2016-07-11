# git delete-tag
zstyle ':completion:*:*:hub:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}
_git-delete-tag() { compadd "$@" $(git tag) }
