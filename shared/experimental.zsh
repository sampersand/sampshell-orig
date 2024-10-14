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
