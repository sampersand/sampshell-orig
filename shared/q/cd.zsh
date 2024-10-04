#!/bin/zsh

################################################
# Commands for changing to directories quicker #
################################################

# Changes to the directory containing the given file
cdd () cd ${${1?'file required'}:h}

# CD's to the temporary directory
cdtmp () cd "${__SU_TEMPORARY_DIRECTORY:-~/tmp}"

# Shorthands for changing to parent directories.
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'

alias md='mkdir -p'
mdc () { mkdir -p ${1?} && cd $1; }

