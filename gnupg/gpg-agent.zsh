if [ -f ~/.gnupg/gpg-agent.conf ] ; then
  eval $(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf)
fi
