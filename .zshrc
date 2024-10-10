export use_old=1
[[ -z $use_old ]] && source ${0:A:h}/old.ignore/.zshrc

source ${0:A:h}/shared/.zshrc
