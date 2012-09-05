txtgrn='\e[0;32m' # Green
txtcyn='\e[0;36m' # Cyan
Color_Off='\e[0m' # Text Reset

PS1="\[$txtcyn\]\w\[$txtgrn\]\$(__git_ps1 '(%s)') \$ \[$Color_Off\]"

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
