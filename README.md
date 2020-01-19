# amdgpu-fancontrol

This is a fork of [grmat/amdgpu-fancontrol](https://github.com/grmat/amdgpu-fancontrol) - simple bash script to control AMD Radeon graphics cards fan pwm.
It is tested with Ubuntu 18.04, Radeon RX-470 and `amdgpu-pro-18.50` drivers.

Changes:
- uses `hwmon1` instead of `hwmon0`
- default bin location to `/usr/local/bin`

This script is meant to be an example. Please don't just run it naively and keep in mind that I'm not responsible for failures.
