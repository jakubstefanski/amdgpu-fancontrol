#!/usr/bin/env bash

set -eu

case $EUID in
0) ;;
*) exec sudo "${0}" "$@" ;;
esac

if [ -f /etc/os-release ]; then
	source /etc/os-release
elif [ -f /usr/lib/os-release ]; then
	source /usr/lib/os-release
else
	echo 'os-release file not found' 1>&2
	exit 1
fi

if [[ "${NAME}" != 'Ubuntu' ]] || [[ "${VERSION_ID}" != '18.04' ]]; then
	echo "${0} is tested only with Ubuntu 18.04" 1>&2
	read -r -p "Are you sure you want to continue? [y/N] " answer </dev/tty
	case ${answer:0:1} in
	y | Y | yes | YES) ;;
	*) exit 1 ;;
	esac
fi

function install_file() {
	local src=$1
	local dest=$2

	mkdir -p "$(dirname "${dest}")"
	cp "${src}" "${dest}"
	echo "Installed ${dest}"
}

install_file ./amdgpu-fancontrol /usr/local/bin/amdgpu-fancontrol
install_file ./amdgpu-fancontrol.service /usr/lib/systemd/system/amdgpu-fancontrol.service
install_file ./etc-amdgpu-fancontrol.cfg /etc/amdgpu-fancontrol.cfg

systemctl enable amdgpu-fancontrol.service
systemctl restart amdgpu-fancontrol.service
systemctl status amdgpu-fancontrol.service
