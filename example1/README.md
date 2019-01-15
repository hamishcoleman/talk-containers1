# Example of using debootstrap

The [demo_debootstrap.sh](demo_debootstrap.sh) script is a simple example of
running debootstrap.

While it is intended to be simple and clear enough to understand, it also
includes some extra steps to try and make the process failsafe.

The script requires a dpkg based distribution to work and should run with
no issues on recent Debian or Ubuntu.

Running the script will:
- Confirm that the directory /var/lib/container-example/example1 does not exist
- install any required packages
- run the debootstrap command

After successfully finishing, there will be a new base filesystem in the
/var/lib/container-example/example1 directory
