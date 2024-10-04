#!/bin/zsh

######################################
# Functions specific to Sublime Text #
######################################

# Opens the supplied files in Sublime Text. If no files are given, defaults to the 
# current directory.
function subl () {
	open -a ${__SS_CFG_EDITOR_APPLICATION_NAME?} -- ${@:-.}
}
alias s=subl

# Same as `subl`, except it creates files if they don't already exist.
function ssubl () {
	for file; do
		if ! [[ -e $file ]]; then
			mkdir -p $file:h
			touch $file
		fi
	done

	subl $@
}
alias ss=ssubl
