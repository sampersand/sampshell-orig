#############################################################################
# Shell options that are used by both scripts and interactive zsh instances #
#############################################################################

setopt EXTENDED_GLOB     # Extra globbing features!
setopt BRACE_CCL         # `{abc0-3}` is  `0 1 2 3 a b c`
setopt GLOB_STAR_SHORT   # `**.c` is a shorthand for `**/*.c`

export PATH=${0:A:h}/bin:$PATH # Add shared commands to the $PATH

## Load other files
for file in ${0:A:h}/both/*; do
	source $file
done
