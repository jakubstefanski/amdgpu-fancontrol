# amdgpu-fancontrol

This is a fork of
[grmat/amdgpu-fancontrol](https://github.com/grmat/amdgpu-fancontrol).

It is a simple bash script along with systemd service definition
to control AMD Radeon graphics cards fan PWM.

The script allows to turn off GPU fans when temperature is low enough.

## Compatibility

Tested with Ubuntu 18.04, Radeon RX-470 and `amdgpu-pro-19.50` drivers.

## Installation

Run `install.sh` script. Feel free to modify it to your needs.

## Changes to upstream repository

- changes default bin location to `/usr/local/bin`
- adds installation script

## Warning

This script is meant to be an example.
Please don't just run it naively and keep in mind
that I'm not responsible for failures.
