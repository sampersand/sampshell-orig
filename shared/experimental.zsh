#!/bin/zsh

# Experimental options i'm working on
if [[ -z $samp_shell_experimental ]]; then
	return
fi

setopt WARN_CREATE_GLOBAL # warn when accidentally creating global variables
setopt WARN_NESTED_VAR    # same with nested locals

histchars[2]=, # instead of `^` we use `,` as it's a lot shorter

setopt EVAL_LINENO # eval linenos start from 1
