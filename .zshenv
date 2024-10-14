export samp_shell_root=${0:A:h}
export use_old=1

[[ -z $use_old ]] && source ${0:A:h}/old.ignore/.zshenv


# setopt WARN_CREATE_GLOBAL # warn when accidentally creating global variables
# setopt WARN_NESTED_VAR    # same with nested locals

source ${0:A:h}/shared/.zshenv

eval "reload () { source ${(Q)0:A}; echo reloaded ${(Q)0:A} }"
