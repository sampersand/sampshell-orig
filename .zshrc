source ${0:A:h}/shared/.zshrc
[[ -e ${0:A:h}/personal/.zshrc ]] && source ${0:A:h}/personal/.zshrc

add-named-dir shell ${0:A:h}

eval "reload () { source ${(Q)0:A}; echo reloaded ${(Q)0:A} }"

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
