#################################################################
# Shell options that are used by just interactive zsh instances #
#################################################################

## Command line
setopt INTERACTIVE_COMMENTS # I use this all the time
setopt RC_QUOTES            # Let you do '' to mean a single `'` within a `'` string
setopt PROMPT_CR            # Put a `\n` before so you dont get the newline ickiness with no-newlines
setopt MAGIC_EQUAL_SUBST # Supplying `a=b` on the command line does `~`/`=` expansion

## Load other files
for file in ${0:A:h}/interactive/*; do
	source $file
done
