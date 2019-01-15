#!/bin/sh
#
# Apply a list of changes to the built image.
# This is for the "instantiate" phase

if [ "$(id -u)" -ne 0 ]; then
    echo ERROR: this script needs to be run with root privileges
    exit 1
fi

if [ -z "$1" ]; then
    echo ERROR: please provide the dir of the base image to adjust
    exit 1
fi
TARGETDIR="$1"
shift

if [ -z "$1" ]; then
    echo ERROR: please provide the hostname to instantiate
    exit 1
fi
HOSTNAME="$1"

# Let the container know what its hostname is
echo "$HOSTNAME" >"$TARGETDIR/etc/hostname"

# Allow network tools within the container to always resolve the hostname
echo "127.0.0.2 $HOSTNAME" >>"$TARGETDIR/etc/hosts"

# If an ssh server is installed, ensure it has keys
if [ -e "$TARGETDIR/etc/ssh/sshd_config" ]; then
    chroot $TARGETDIR /usr/sbin/dpkg-reconfigure openssh-server
fi
