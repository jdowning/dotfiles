alias pd=podman
if ! command -v docker > /dev/null && command -v podman > /dev/null ; then
  alias docker=podman
fi
