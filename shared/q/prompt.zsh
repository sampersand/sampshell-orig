setopt promptsubst
__git_ps1 () { echo "" } # todo

export PS1=$(() {
    echo -n '%B%F{blue}[%b' # starting [
    echo -n '%F{cyan}%D{%_I:%M:%S %p}%f' # time
    echo -n ' %!' # history
    echo -n '%(?.. %F{red}%B%?)' # previous exit status
    echo -n '%(2L. %F{red}SHLVL=%L.)' # shellevel
    echo -n '%B%F{blue}]%b%f' # closing `]`
    echo -n "%${__SU_PWD_MAX_LENGTH:-65}>..>" # PWD+GIT ONLY 65 CHARS LONG.
    echo -n ' %F{11}%1d%f' # path
    echo -n '%B%F{cyan}$(__git_ps1 " %s")%f' # git branch
    echo -n '%<<' # if it wasnt printed by ps1
    echo -n '%b %F{8}%#%f ' # ending %
})
