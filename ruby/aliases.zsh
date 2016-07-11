function update-rbenv {
  cd /opt/boxen/rbenv && git pull
  cd /opt/boxen/ruby-build && git pull
}
