# This file contains aliases to make life easier

alias confdiff='diff -r $CONF_DIR/conf/ ~/ | grep -v "Only in /home/alex*"'
alias confedit='atom $CONF_DIR/; atom ~/'
alias confinstall='$CONF_DIR/install.sh'
