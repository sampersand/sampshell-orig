#!/bin/zsh

#############################################################################
# Shell options that are used by both scripts and interactive zsh instances #
#############################################################################

: ${samp_shell_shared_home:=${0:A:h}}
export samp_shell_shared_home

setopt EXTENDED_GLOB   # Extra globbing features!
setopt BRACE_CCL       # `{abc0-3}` is  `0 1 2 3 a b c`
setopt GLOB_STAR_SHORT # `**.c` is a shorthand for `**/*.c`

export path=($samp_shell_shared_home/bin $path)

## Load other files
for file in $samp_shell_shared_home/both/*; do
	source $file
done
