source ${0:A:h}/shared/.zshrc
source ${0:A:h}/personal/.zshrc

eval "reloadzshrc () { . ${0:A} && echo 'reloaded ${(q)0:A}' }"
alias reload=reloadzshrc
