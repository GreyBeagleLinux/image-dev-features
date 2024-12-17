#!/bin/sh
set -e

packages="locales curl wget xz-utils sudo git rsync file python3 python3-pip python3-venv lshw gdisk fdisk parted fakechroot fakeroot bmap-tools qemu-system-x86 software-properties-common ca-certificates psmisc procps"

echo "Installing required packages"

apt update

echo "Installing required packages"

DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y $packages

echo "Setup en_US-UTF-8 locale"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
locale-gen en_US.UTF-8

