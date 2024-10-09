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

setopt EXTENDED_GLOB     # Extra globbing features!
setopt BRACE_CCL         # `{abc0-3}` is  `0 1 2 3 a b c`
setopt GLOB_STAR_SHORT   # `**.c` is a shorthand for `**/*.c`
setopt MAGIC_EQUAL_SUBST # Supplying `a=b` on the command line does `~`/`=` expansion
# setopt BAD_PATTERN # TODO?

if false; then
	setopt WARN_CREATE_GLOBAL # warn when accidentally creating global variables
	setopt WARN_NESTED_VAR    # same with nested locals
fi # TODO


# Ensure that the shared `.zshenv` is loaded; shared should always be available.
source-or-warn $_samp_shell_root/shared/.zshenv    # Shared `.zshenv` should always be around
source-optional $_samp_shell_root/personal/.zshenv # Load a personal `.zshenv`, if present
