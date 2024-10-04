#!/bin/zsh

# alias -g __dir__ ${0:h}

for file in ${0:h}/interactive/*; do
	source $file
done
