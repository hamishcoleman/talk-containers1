# Creating Ubuntu and Debian container base images, the old and simple way

Containers are everywhere, but do you know how to create the root filesystems
that they use? There are simple tools available to create your own custom
Ubuntu or Debian root filesystem. By using these tools to build environments
matching your needs, you will end up with a better understanding of how
containers are built - and how to debug them - as well as gain access to more
options that can speed up your own builds and testing.

In [this presentation](slides.html), I will show the debootstrap and
multistrap tools and provide worked examples on how to avoid their gotchas
and end up with a bootable root filesystem.

This repository also contains some simple examples as a reference for the
presentation.
