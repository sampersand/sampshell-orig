#!/bin/zsh

setopt EXTENDED_GLOB # Extra globbing features!
typeset -U path # make `path` unique; also path is just $PATH but lower-case
path=(${0:A:h}/shared/bin\
		$path)
export PATH
# export -TU PATH path # make `path` unique; also path is just $PATH but lower-case
