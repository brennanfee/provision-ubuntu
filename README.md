# provision-ubuntu

Ansible scripts to provision my personal Ubuntu machines.

## Ubuntu Versions

At present the master branch assumes the current LTS edition (16.04 at present),
while a branch called NonLTS is used for the most recent non-LTS edition
(17.04 at present).  During times when the LTS edition is the current edition,
those two branches should generally match.  As needed, I might use separate
branches for other interim work, but they should generally be ignored.

## Desktop Environments

At present I support two desktop environments for configuration.
KDE and MATE.  In time I may choose one of the two and stick with it and will
then remove the other.  Either way, both options also install i3wm which can
be used for a tiling experience.  This does mean that a "blank" or
command-line only installation is not possible with these scripts.  Even on
servers I find having a DE is still beneficial and with hardware these days
there's no need to worry about resources.
