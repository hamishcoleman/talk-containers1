#!/bin/sh
#
# Apply a list of changes to the built image.
# This is for the "fixup" phase

if [ "$(id -u)" -ne 0 ]; then
    echo ERROR: this script needs to be run with root privileges
    exit 1
fi

if [ -z "$1" ]; then
    echo ERROR: please provide the dir of the base image to adjust
    exit 1
fi
TARGETDIR="$1"

# Ensure that the system hs no default hostname (some installers simply
# copy the host system's hostname!)
# Since we now have no hostname, we will inherit the hostname issued to us
# by the container framework
shred -fu "$TARGETDIR/etc/hostname"

# Remove any uniqe machine identifier
# (systemd will create a new one on bootup)
shred -fu "$TARGETDIR/etc/machine-id"

# Remove any ssh keys - these should not be shared between systems
# (if ssh is installed, the keys need to be regenerated on instantiation)
shred -fu "$TARGETDIR/etc/ssh"/*_key

# Ensure that the image has a working resolver config
echo "nameserver 1.1.1.1" > "$TARGETDIR/etc/resolv.conf"

