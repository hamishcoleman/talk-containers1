#!/bin/sh
#
# Apply a list of changes to the built image.
# This is for the "minimise" phase

if [ "$(id -u)" -ne 0 ]; then
    echo ERROR: this script needs to be run with root privileges
    exit 1
fi

if [ -z "$1" ]; then
    echo ERROR: please provide the dir of the base image to adjust
    exit 1
fi
TARGETDIR="$1"

# These are the two biggest savings
rm -rf "$TARGETDIR/usr/share/locale"/*
rm -rf "$TARGETDIR/usr/share/doc"/*

# Udev can regenerate this from its other files, and it is not as useful on
# a containerised system
rm -rf "$TARGETDIR/lib/udev/hwdb.bin"

# Unneeded backups
rm -f "$TARGETDIR/var/cache/debconf"/*-old "$TARGETDIR/var/lib/dpkg"/*-old

# All the timezone data is generally not needed in a container
# - either the system is going to be running UTC, or a single timezone file
# can be copied in later to configure the image
rm -rf "$TARGETDIR/usr/share/zoneinfo"/*
