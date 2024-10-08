# Make sure we're on zsh
[ -z "$ZSH_VERSION" ] && return

# Variable for the root directory of samp shell.
export _samp_shell_root=${0:A:h}

# Ensure that the shared `.zshenv` is loaded; shared should always be available.
source $_samp_shell_root/shared/.zshenv

# If a personal `.zshenv` is present, then load it.
[[ -e $_samp_shell_root/personal/.zshenv ]] && source $_samp_shell_root/personal/.zshenv
