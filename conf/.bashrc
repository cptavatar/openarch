#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

source ~/.config/bash/bash-export.sh
source ~/.config/bash/bash-prompt.sh
source ~/.config/bash/bash-alias.sh
