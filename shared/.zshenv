#!/bin/zsh

#############################################################################
# Shell options that are used by both scripts and interactive zsh instances #
#############################################################################

## Ensure `SAMP_SHELL_SHARED_HOME` is set
export SAMP_SHELL_SHARED_HOME=${SAMP_SHELL_SHARED_HOME:-${0:A:h}}

## Make sure that `$PATH` is properly set.
export PATH=$SAMP_SHELL_SHARED_HOME/bin:$PATH

## Globing options that are always enabled
setopt EXTENDED_GLOB   # Extra globbing features!
setopt BRACE_CCL       # `{abc0-3}` is  `0 1 2 3 a b c`
setopt GLOB_STAR_SHORT # `**.c` is a shorthand for `**/*.c`

## Load up config variables
source $SAMP_SHELL_SHARED_HOME/both/config.zsh


## Add source helper functions
# Same as `source`, except only does it if the file exists.
function source-optional () for file; do
	[[ -e $file ]] && source $file
done

# Same as `source`, except warns if it doesn't exist.
function source-or-warn () for file; do
	if [[ -e $file ]]; then
		source $file
	else
		warn "Unable to source file: $file"
	fi
done
