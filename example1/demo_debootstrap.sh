#!/bin/sh
#
#
TARGETDIR=/var/lib/container/example1

if ! type apt-get >/dev/null; then
    echo ERROR: this script only runs on Debian-based systems
    exit 1
fi

if sudo find "$TARGETDIR" -maxdepth 1 >/dev/null 2>&1; then
    echo ERROR: $TARGETDIR exists - refusing to overwrite it
    echo If you still wish to continue, remove that directory and rerun
    exit 1
fi

set -e
sudo apt-get install debootstrap

set -x
sudo debootstrap --arch=amd64 \
    stretch \
    $TARGETDIR \
    http://httpredir.debian.org/debian

