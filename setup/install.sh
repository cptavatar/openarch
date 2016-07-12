#/bin/sh
for i in $( cat pkglist); do
	pacman -Su --noconfirm $i;
done



