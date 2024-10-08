# Make sure we're on zsh
[ -z "$ZSH_VERSION" ] && return

# Ensure that `_samp_shell_root` exists; it should have been set in `<this folder>/.zshenv`
: ${_samp_shell_root}

# Ensure that the shared `.zshrc` is loaded; shared should always be available.
source ${_samp_shell_root?}/shared/.zshrc

# If a personal `.zshrc` is present, then load it.
[[ -e $_samp_shell_root/personal/.zshrc ]] && source $_samp_shell_root/personal/.zshrc

# Add a reload function to reload shell debugging files.
function samp_shell_reload () {
	local __file__=${_samp_shell_root?}/${1:-.zshrc}
	builtin source $__file__ && builtin echo "reloaded $__file__"
}

alias reload=samp_shell_reload
