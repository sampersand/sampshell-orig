#!/bin/zsh

setopt PROMPT_SUBST # allows you to use variable substitutions in prompts

# RPS1 <-- lets you set stuff onthe right-hand-side of the screen
if false; then
	code=/some/directory/here
	: ~code # <-- now you can use `%~` and it'll show `~code` as a base

