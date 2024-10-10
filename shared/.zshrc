#################################################################
# Shell options that are used by just interactive zsh instances #
#################################################################

export -A samp_shell_options

samp_shell_options[safety]=1

## Command line
setopt INTERACTIVE_COMMENTS # I use this all the time
setopt RC_QUOTES            # Let you do '' to mean a single `'` within a `'` string
setopt PROMPT_CR            # Put a `\n` before so you dont get the newline ickiness with no-newlines
setopt MAGIC_EQUAL_SUBST # Supplying `a=b` on the command line does `~`/`=` expansion

## Jobs
setopt BG_NICE            # all background jobs run at the same nice level
setopt CHECK_JOBS         # Do not exit shells when there are still suspended jobs
setopt CHECK_RUNNING_JOBS # Also check for running jobs

## Load other files
for file in ${0:A:h}/interactive/*; do
	source $file
done
