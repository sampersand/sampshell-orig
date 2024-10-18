#!/bin/zsh

#################################################################
# Shell options that are used by just interactive zsh instances #
#################################################################

function does-function-exist () typeset -f ${1?} >&-

## Load other script files
for file in $SAMP_SHELL_HOME/interactive/*; do
	source $file
done

## Load experimental changes
[[ -n $SAMP_SHELL_EXPERIMENTAL ]] && source $SAMP_SHELL_HOME/experimental.zsh

for file in $SAMP_SHELL_HOME/setup/*; do
	source $file
done

## Heyyy, you can paste URLs in and not have to quote them!
autoload -U bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

echo 'look into pattern matching (https://zsh.sourceforge.io/Doc/Release/Expansion.html#Filename-Generation)'
