#!/bin/zsh

## Experimental options i'm working on
if [[ -z $samp_shell_experimental ]]; then
	return
fi

echo '(enabling experimental samp-shell options)'

setopt WARN_CREATE_GLOBAL # warn when accidentally creating global variables
setopt WARN_NESTED_VAR    # same with nested locals

histchars[2]=, # instead of `^` we use `,` as it's a lot shorter

setopt EVAL_LINENO # eval linenos start from 1
setopt MAGIC_EQUAL_SUBST # Supplying `a=b` on the command line does `~`/`=` expansion
# setopt BAD_PATTERN # TODO?



alias -g '$pwc="$(current-commit)"'
alias -g '$pwb="$(current-branch)"'
alias -g '$mbr="$(master-branch)"'

# OLD global aliases i used to use, but now no longer.
alias -g 'T=| tail'
alias -g 'TN=| tail -n'
alias -g 'T1=| tail -n 1'
alias -g 'H=| head'
alias -g 'HN=| head -n'
alias -g 'H1=| head -n 1'

alias -g 'WC=| wc'
alias -g 'WCL=| wc -l'
alias -g 'GR=| grep --'
alias -g 'GRR=| grep'

alias -g 'NERR=2>&-'
