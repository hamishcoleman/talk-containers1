#!/bin/sh
#
# Apply a list of changes to the built image.
# This is for the "customise" phase

if [ "$(id -u)" -ne 0 ]; then
    echo ERROR: this script needs to be run with root privileges
    exit 1
fi

if [ -z "$1" ]; then
    echo ERROR: please provide the dir of the base image to adjust
    exit 1
fi
TARGETDIR="$1"

# If you have a set of bootstrap users, create them here (and probably give
# them sudo access)
# chroot "$TARGETDIR" useradd -u $uid -s /bin/bash -G sudo -m $name

# Alternatively, mainly for demonstration purposes, generate a random password
ROOT_PW=$(dd if=/dev/urandom bs=1 count=8 |sha256sum |cut -c1-8)
echo "INFO: root password generated is $ROOT_PW"

# Set root to use that password
echo "root:$ROOT_PW" | chpasswd -c SHA256 -R "$TARGETDIR"

# If your containerisation infrastructure needs specific network config, then
# this would be where to set it:
# echo "auto eth0" >/etc/network/interfaces.d/eth0
# echo "iface eth0 inet dhcp" >>/etc/network/interfaces.d/eth0

# Other settings that could go here:
# - package repository proxy
# - monitoring system config
# - add build tags or logs into the image
