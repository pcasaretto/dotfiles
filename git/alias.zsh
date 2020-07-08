# Aliases
alias gst='git status'
alias gsw='git switch'
alias gl='git pull --prune'
alias gup='git pull --prune --rebase'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gco='git checkout'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}
