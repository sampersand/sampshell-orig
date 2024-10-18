export SAMP_SHELL_EDITOR=sublime4
export SAMP_SHELL_TRASH_DIR=~/.Trash/.samp-shell-trash
export SAMP_SHELL_TMP_DIR=~/tmp
# export SAMP_SHELL_EXPERIMENTAL # Don't enable experimental stuff


## Add source helper functions
# Same as `source`, except only does it if the file exists.
function source-optional () for file; do
	[[ -e $file ]] && source $file
done

# Same as `source`, except warns if it doesn't exist.
function source-or-warn () for file; do
	if [[ -e $file ]]; then
		source $file
	else
		warn "Unable to source file: $file"
	fi
done
