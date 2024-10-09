#!/bin/zsh

# Make sure we're on zsh
[ -n "$ZSH_VERSION" ] || return

# Ensure that `_samp_shell_root` exists; it should have been set in `<this folder>/.zshenv`
: ${_samp_shell_root?_samp_shell_root needs to be set}

source-or-warn $_samp_shell_root/shared/.zshrc    # Shared `.zshrc` should always be around
source-optional $_samp_shell_root/personal/.zshrc # Personal `.zshrc` might not be around

# Add a reload function to reload shell debugging files.
function samp_shell_reload () {
	local __file__=${_samp_shell_root?}/${1:-.zshrc}
	builtin source $__file__ && builtin echo "reloaded $__file__"
}

alias reload=samp_shell_reload
