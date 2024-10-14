#!/bin/zsh

#################################################################
# Shell options that are used by just interactive zsh instances #
#################################################################

## Load other script files
for file in $samp_shell_shared_home/interactive/*; do
	source $file
done

## Load experimental changes
source $samp_shell_shared_home/experimental.zsh

for file in $samp_shell_shared_home/setup/*; do
	source $file
done
