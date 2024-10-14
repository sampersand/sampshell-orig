#!/bin/zsh

if [[ -z $samp_shell_home ]]; then
	warn '$samp_shell_home is not set!'
	samp_shell_home=${0:A:h}
fi

# Experimental options i'm working on
if [[ -n $samp_shell_experimental ]]; then
	histchars[2]=, # instead of `^` we use `,` as it's a lot shorter
fi

# Source shared and personal `.zshrc`s
source          $samp_shell_home/shared/.zshrc   # Load required shared zshrc
source-optional $samp_shell_home/personal/.zshrc # Optional load personal zshrc

# Add the standard home dirs.
## Add the builtin named directories
add-named-dir ~/me
add-named-dir ~/tmp
add-named-dir shell $samp_shell_home
[[ $VENDOR == apple ]] && add-named-dir trash ~/.Trash/.samp-shell-trash


source ${0:A:h}/shared/.zshrc
[[ -e ${0:A:h}/personal/.zshrc ]] && source ${0:A:h}/personal/.zshrc

add-named-dir shell ${0:A:h}

eval "reload () { source ${(Q)0:A}; echo reloaded ${(Q)0:A} }"
