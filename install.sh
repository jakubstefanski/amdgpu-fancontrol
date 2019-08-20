#!/usr/bin/env bash

set -eu

sudo=''
if ((EUID != 0)); then
  sudo='sudo'
fi

copy_system_file() {
  local src=$1
  local dest=$2

  ${sudo} mkdir -p "$(dirname "${dest}")"
  ${sudo} cp "${src}" "${dest}"
  echo "Installed ${dest}"
}

copy_system_file ./amdgpu-fancontrol /usr/local/bin/amdgpu-fancontrol
copy_system_file ./amdgpu-fancontrol.service /usr/lib/systemd/system/amdgpu-fancontrol.service
copy_system_file ./etc-amdgpu-fancontrol.cfg /etc/amdgpu-fancontrol.cfg

${sudo} systemctl enable amdgpu-fancontrol.service
${sudo} systemctl start amdgpu-fancontrol.service
systemctl status amdgpu-fancontrol.service
