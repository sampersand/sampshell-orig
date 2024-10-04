#!/bin/zsh

# TODO

####################################################
# Replacing builtins with less destructive version #
####################################################

# Prevent `>` from overwriting files and `>>` from creating new ones.
# Note that `>{|,!}` and `>>{|,!}` is the syntax to bypass this.
setopt NOCLOBBER

# Only delete things within version control history; if not
# in a git repo, asks before deleting.
rm () if ! is-in-a-git-repo; then
	git rm "$@"
else
	command rm -i "$@"
fi

# Ask before overwriting with `mv` and `cp` commands.
alias mv='mv -i'
alias cp='cp -i'

# Repeating the last letter is the builtin version of the destructive commands.
alias rmm='command rm'
alias mvv='command mv'
alias cpp='command cp'
