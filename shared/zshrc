#!/bin/zsh

# alias -g __dir__ ${0:h}
typeset -gxAH samp_shell_options

samp_shell_setopt () {
	if [[ $# = 1 ]]; then
		set -- ${${(M)1#*=}%?} ${1#*=}
	fi

	samp_shell_options[${1?}]=${2?}
}

for file in ${0:A:h}/interactive/*; do
	source $file
done

source ${0:A:h}/old/config.zsh
