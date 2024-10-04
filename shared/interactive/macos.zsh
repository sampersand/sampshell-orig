#!/bin/zsh

###############################
# Functions specific to macOS #
###############################

[[ $VENDOR != apple ]] && return # these only exist on macOS

# Same as `pbcopy` but will copy its arguments to the pastebin if given.
pbc () if [[ $# = 0 ]]; then
	pbcopy
else
	echo "$*" | pbcopy
fi

# Pastes the pasteboard
alias pbp=pbpaste


# TODO: caffeinate things
