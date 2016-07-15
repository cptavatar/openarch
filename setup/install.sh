#/bin/sh
# this is WRONG, needs love
for i in $( cat pkglist); do
	pacman -Su --noconfirm $i;
done
