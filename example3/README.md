# Example improvement scripts

The following scripts are present to show the various steps to improve the
built image:
- [demo_phase_fixup.sh](demo_phase_fixup.sh)
- [demo_phase_customise.sh](demo_phase_customise.sh)
- [demo_phase_minimise.sh](demo_phase_minimise.sh)

These scripts are a slightly version of what is in the slides, with comments
to explain the actions.

Each script expects to be run as root and must be given the name of the
base directory as a commandline parameter.

Thus, to run all the scripts on the example1:

```
sudo demo_phase_fixup.sh /var/lib/container-example/example1
sudo demo_phase_customise.sh /var/lib/container-example/example1
sudo demo_phase_minimise.sh /var/lib/container-example/example1
```

Finally, to instantiate a copy of a container:

```
sudo demo_phase_instantiate.sh /var/lib/container-example/newhost newhostname
```
