# This file contains aliases to make life easier

# couple of useful utils for managing our configuration
alias confdiff='diff -r $CONF_DIR/conf/ ~/ | grep -v "Only in /home/alex*"'
alias confedit='atom $CONF_DIR/; atom ~/'
alias confinstall='$CONF_DIR/install.sh'

# Take the current list of *explicitly* installed programs, save for future
# so we can reproduce if want
alias pkgcapture='pacman -Qet > $CONF_DIR/setup/pkglist'

# same for aur
alias aurcapture='aurinstalled | sort > $CONF_DIR/setup/aurlist'
