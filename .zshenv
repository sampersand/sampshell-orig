[ -z "$ZSH_VERSION" ] && return

export _samp_shell_root=${0:A:h}

[[ -e $_samp_shell_root/shared/.zshenv ]]   && source $_samp_shell_root/shared/.zshenv
[[ -e $_samp_shell_root/personal/.zshenv ]] && source $_samp_shell_root/personal/.zshenv
