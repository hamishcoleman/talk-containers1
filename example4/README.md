# Example libvirt xml

The libvirt system requires you to define any virtual machines before you can
use them.  While there are GUI tools to assist with this process, the
portable and canonical method is to use an XML definition.

- [dbvirt-lxc-example.xml](libvirt-lxc-example.xml)

This config file is a minimal definition for a LXC system, with two key
settings that would need to be changed to be used for multiple tests:

- name
- filesystem source dir

If you have a virtual machine root filesystem in the
/var/lib/container-example/newhost sub-directory, this command be used:

```
virsh -c lxc:/// define newhost.xml
sudo demo_phase_minimise.sh /var/lib/container-example/example1
```
