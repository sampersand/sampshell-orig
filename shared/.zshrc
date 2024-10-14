#!/bin/zsh

#################################################################
# Shell options that are used by just interactive zsh instances #
#################################################################

## Load other script files
for file in $SAMP_SHELL_SHARED_HOME/interactive/*; do
	source $file
done

## Load experimental changes
source $SAMP_SHELL_SHARED_HOME/experimental.zsh

for file in $SAMP_SHELL_SHARED_HOME/setup/*; do
	source $file
done
