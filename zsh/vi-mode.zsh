# Vi mode
bindkey -v

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# use v to edit line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# By default, there is a 0.4 second delay after you hit the <ESC> key and when
# the mode change is registered. This results in a very jarring and frustrating
# transition between modes. Let's reduce this delay to 0.1 seconds
export KEYTIMEOUT=1
