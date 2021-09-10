alias pd=podman
if ! command -v docker && command -v podman ; then
  alias docker=podman
fi
