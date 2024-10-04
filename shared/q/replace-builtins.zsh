#!/bin/zsh

####################################################
# Replacing builtins with more convenient versions #
####################################################

# Change `ls` to:
#  -A  Always print `.` files, excluding `.` and `..`
#  -G  Always print colours out
#  -b  Print escape squences for nonnormal filenames
alias ls='ls -AGb'

# Prints out the last 50 history entries.
history () builtin history "${@:-50}"
alias h=history # Shorthand cause `history` is a pain.

# `grep` should print out colors normally.
alias grep='grep --color=auto'

# Like the normal `touch`, except it also creates the parent directories.
touch () {
	mkdir -p ${@:h} && command touch $@
}
