#ws will autocomplete with the folders in your workspace
_ws () { 
  local cur=${COMP_WORDS[COMP_CWORD]}
  local dires=$(ls $WORKSPACE)
  COMPREPLY=( $(compgen -W "$dires" -- $cur) )
}
