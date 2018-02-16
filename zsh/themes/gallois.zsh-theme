ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

RPS1='$(git_custom_status) $EPS1'

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    MODE_TEXT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    RPS1='$MODE_TEXT $(git_custom_status) $EPS1'
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

precmd() { print -rP '%F{cyan}%~%f '}
PROMPT="%(?.%{$fg[green]%}.%{$fg[red]%})%Bλ%b "
