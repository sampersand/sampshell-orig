export use_old=1
[[ -z $use_old ]] && source ${0:A:h}/old.ignore/.zshrc

source ${0:A:h}/shared/.zshrc
[[ -e ${0:A:h}/personal/.zshrc ]] && source ${0:A:h}/personal/.zshrc

add-named-dir shell ${0:A:h}


if [[ -n samp_shell_experimental ]]; then
	histchars[2]=, # instead of `^` we use `,` as it's a lot shorter

	# setopt WARN_CREATE_GLOBAL # warn when accidentally creating global variables
	# setopt WARN_NESTED_VAR    # same with nested locals

	# TRAPEXIT () {
	# 	setopt NO_WARN_CREATE_GLOBAL
	# 	setopt NO_WARN_NESTED_VAR
	# 	return 1
	# }
fi
