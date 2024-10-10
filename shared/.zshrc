#################################################################
# Shell options that are used by just interactive zsh instances #
#################################################################

## Load other files
for file in ${0:A:h}/interactive/*; do
	source $file
done
