#!/bin/zsh

export __SS_CFG_HOME=${0:A:h}
export PATH=$__SS_CFG_HOME/bin:$PATH

source $__SS_CFG_HOME/config.zsh

eval "function reload { source ${0:A} && echo \"reloaded ${0:A}\" }"

alias sublme="subl $__SS_CFG_HOME"

for file in ${0:h}/interactive; do
	source $file
done
