alias be='bundle exec'
# alias ws='cd $WORKSPACE'

#ws will autocomplete with the folders in your workspace
_ws () { 
  local cur=${COMP_WORDS[COMP_CWORD]}
  local dires=$(ls $WORKSPACE)
  COMPREPLY=( $(compgen -W "$dires" -- $cur) )
}
ws () { 
  cd "$WORKSPACE/$@"
}

function fullpath() {
    echo `pwd`/"$1"
}
complete -F _ws ws