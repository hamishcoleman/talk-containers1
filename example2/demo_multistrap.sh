#!/bin/sh
#
#
TARGETDIR=/var/lib/container/example2

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
sudo apt-get install multistrap

# Ensure we are in the right directory so that references to the
# multistrap.conf and multistrap.configscrip both work
SCRIPTDIR=$(dirname "$0")
cd "$SCRIPTDIR"

set -x

# First run the install stage
sudo /usr/sbin/multistrap --arch amd64 \
    -f multistrap.conf \
    -d $TARGETDIR

# Then run the configure stage
sudo chroot $TARGETDIR ./multistrap.configscript

# Clean up
sudo rm $TARGETDIR/multistrap.configscript
