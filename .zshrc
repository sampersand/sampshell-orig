[[ -e ${0:A:h}/shared/.zshrc ]]   && source ${0:A:h}/shared/.zshrc
[[ -e ${0:A:h}/personal/.zshrc ]] && source ${0:A:h}/personal/.zshrc

eval "function reload () { source ${0:-${(Q)0:A}} && echo 'reloaded ${(q)0:A}' }"
