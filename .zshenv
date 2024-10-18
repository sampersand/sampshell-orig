#!/bin/zsh


#############################################################################
# Shell options that are used by both scripts and interactive zsh instances #
#############################################################################

## Ensure `SAMP_SHELL_HOME` is set
export SAMP_SHELL_HOME=${SAMP_SHELL_HOME:-${0:A:h}}

## Make sure that `$PATH` has the samp shell bin.
if ! (( $path[(Ie)$SAMP_SHELL_HOME] )); then
	export PATH=$SAMP_SHELL_HOME/bin:$PATH
fi

## Globing options that are always enabled
setopt EXTENDED_GLOB   # Extra globbing features
setopt BRACE_CCL       # `{abc0-3}` is  `0 1 2 3 a b c`
setopt GLOB_STAR_SHORT # `**.c` is a shorthand for `**/*.c`

## Setup shell config files; make sure to not override them.
export SAMP_SHELL_EDITOR=${SAMP_SHELL_EDITOR:-sublime4}
export SAMP_SHELL_TRASH_DIR=${SAMP_SHELL_TRASH_DIR:-~/.Trash/.samp-shell-trash}
export SAMP_SHELL_TMP_DIR=${SAMP_SHELL_TMP_DIR:-~/tmp}
export SAMP_SHELL_EXPERIMENTAL=$SAMP_SHELL_EXPERIMENTAL

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
