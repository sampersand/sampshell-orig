#################################################################
# Shell options that are used by just interactive zsh instances #
#################################################################

# ## If `$samp_shell_shared_home` is not set then redo it.
# if [[ -z $samp_shell_shared_home ]]; then
# 	warn '$samp_shell_shared_home is not set!'
# 	source ${0:A:h}/.zshenv
# fi

## Load other files
for file in $samp_shell_shared_home/interactive/*; do
	source $file
done

source $samp_shell_shared_home/experimental.zsh

return


# Source shared and personal `.zshrc`s
source          $samp_shell_shared_home/shared/.zshrc   # Load required shared zshrc
source-optional $samp_shell_shared_home/personal/.zshrc # Optional load personal zshrc

## Add the builtin named directories
add-named-dir ~/me
add-named-dir ~/tmp
add-named-dir shell $samp_shell_shared_home
[[ $VENDOR == apple ]] && add-named-dir trash ~/.Trash/.samp-shell-trash

source ${0:A:h}/shared/.zshrc
[[ -e ${0:A:h}/personal/.zshrc ]] && source ${0:A:h}/personal/.zshrc

add-named-dir shell ${0:A:h}

eval "reload () { source ${(Q)0:A}; echo reloaded ${(Q)0:A} }"
