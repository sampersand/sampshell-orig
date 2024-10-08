#!/bin/zsh

#############################
# Git Commands & Shorthands #
#############################

# Shorthand alias
alias g=git
alias grb='git rebase'

#misc
alias gch='git checkout'
alias gcp='git cherry-pick'
alias gg='git grep'

# working area
alias ginit='git init'
gcl () {
	git clone ${1?'must supply a repo'} && cd ${1:t:r}
}

# modifying tracked & untracked files
alias ga='git add'
alias grs='git reset'
alias greset=grs
alias grm='git rm'
alias gco='git checkout'

# Adds all the files in a given directory. If an arguments are given, they're taken to be the 
# commit message (and supplied to `gcm`).
gaa () {
	git add --all || return
	[[ $# = 0 ]] || gcm $@ # commit if a message is given
	git status
}

# "Oopsies I messed up my PR!" --- Adds all the changed files (or whatever's given on the command
# line), amends them to the current commit, and force pushes.
goops () {
	git add "${@:---all}" && git commit --amend --no-edit && git push --force
}

gclear () {
	git add --all && git stash push && git status
}

#########################
# Interact with Commits #
#########################

alias gs='git status'

# Commits untracked files; all arguments are joined with a space.
gcm () git commit ${1+--message} ${(j: :)@}

# Gets the difference between the current revision and, by default, `HEAD`. (Note that this is
# different than how `git diff` normally works; I find this is far more convenient.)
gd () git diff "${@:-HEAD}"

# Git diff against the master branch.
gdm () git diff "$(master-branch)"

# Amends the current commit with the current changes.
alias gnit='git commit --amend --no-edit'

#########################
# Interact with History #
#########################
alias gl='git log'
alias gsp='git stash pop'
alias gstash='git stash'

# It's a bit of a pain to type to type the braces, so this is a shorthand.
for i in {1..10}; do
	alias -g "@-$i=@{-$i}"
done

# interact with branches
alias gbr='git branch'

gsw () git switch "${@:-"@{-1}"}"
gswm () git switch "$(master-branch)"

gm () git merge "${@:-"@{-1}"}"
gmm () git merge "$(master-branch)"

gnb () {
	if [[ $# = 0 ]]; then
		eecho 'missing branch name'
		return 1
	fi

	git switch --create "${__SU_GIT_BRANCH_PREFIX?}/$(date +%y-%m-%d)/${(j:-:)@}"
}

gdb () {
	[[ $# = 0 && $1 = '-' ]] && set -- '@{-1}'
	git branch --delete $@
}

alias grename='git branch --move'
alias gbmv=grename
alias gbrmv=grename

gsquash () {
	git reset --soft "$(git merge-base ${1-"$(master-branch)"} HEAD)"
}

# interact with remote
gremove-remote () {
	git branch -d | xargs -L1 git branch -Dr
}
alias gf='git fetch'
alias gpl='git pull'
alias gph='git push'
alias gphf='git push --force'

# deprecated aliases
alias gfetch=gf
alias gpull=gpl
alias gpush=gph