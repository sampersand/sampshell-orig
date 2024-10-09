#!/bin/zsh

# Make sure we're on zsh
[ -n "$ZSH_VERSION" ] || return

# Variable for the root directory of samp shell.
export _samp_shell_root=${0:A:h}

# Same as `source`, except only does it if the file exists.
function source-optional () for file; do
	[[ -e "$file" ]] && source $file
done

# Same as `source`, except warns if it doesn't exist.
function source-or-warn () {
	for file in $*; do
		if [[ ! -e $file ]]; then
			echo "[warn] Unable to source file: $file" >&2
		else
			source $file
		fi
	done
}

# Ensure that the shared `.zshenv` is loaded; shared should always be available.
source-or-warn $_samp_shell_root/shared/.zshenv    # Shared `.zshenv` should always be around
source-optional $_samp_shell_root/personal/.zshenv # Load a personal `.zshenv`, if present
