# Example of using multistrap, including config file

The [demo_multistrap.sh](demo_multistrap.sh) script is a simple example of
running multistrap.

Compared to the details in the slides, this example has:
- an expanded [multistrap.conf](multistrap.conf) with more comments and some
more default setttings
- A [multistrap.configscript](multistrap.configscript) script to perform the
configure stage.

While it is intended to be simple and clear enough to understand, it also
includes some extra steps to try and make the process failsafe.

The script requires a dpkg based distribution to work and should run with
no issues on recent Debian or Ubuntu.

Running the script will:
- Confirm that the directory /var/lib/container-example/example2 does not exist
- install any required packages
- run the multistrap command

After successfully finishing, there will be a new base filesystem in the
/var/lib/container-example/example2 directory
