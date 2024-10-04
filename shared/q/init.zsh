#!/bin/zsh

setopt interactivecomments # Allow comments on command line
setopt histignorespace     # ignore commands that start with space
setopt histnostore         # Don't store the `history` command
setopt histignoredups      # don't store immediate duplicates

# setopt autopushd # each cd does `pushd`
# setopt extendedglob # for extended globbing?

for file in ${0:a:h}/*.zsh; do
	[[ $file = $0 ]] || source $file
done
