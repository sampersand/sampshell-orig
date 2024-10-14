#!/bin/zsh

export samp_shell_home=${0:A:h} # Root folder for the samp shell.

if [[ -n $samp_shell_experimental ]]; then
	setopt WARN_CREATE_GLOBAL # warn when accidentally creating global variables
	setopt WARN_NESTED_VAR    # same with nested locals
fi

# Source shared and personal `.zshenv`s
source          $samp_shell_home/shared/.zshenv
source-optional $samp_shell_home/personal/.zshenv
