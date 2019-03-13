# Example libvirt xml

The libvirt system requires you to define any virtual machines before you can
use them.  While there are GUI tools to assist with this process, the
portable and canonical method is to use an XML definition.

- [dbvirt-lxc-example1.xml](libvirt-lxc-example1.xml)

This config file is a minimal definition for a LXC system, with two key
settings that would need to be changed to be used for multiple tests:

- name
- filesystem source dir

If you have been following the exmaple scripts, you will have a container
root filesystem in the /var/lib/container-example/example1 sub-directory
and can use this example file unedited with the following command:

```
virsh -c lxc:/// define libvirt-lxc-example1.xml
```
