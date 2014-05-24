# Vi mode
bindkey -v

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# Add support for text objects https://github.com/hchbaw/opp.zsh
source "${0:h}/opp/opp.zsh"
source "${0:h}/opp/opp/surround.zsh"

# By default, there is a 0.4 second delay after you hit the <ESC> key and when
# the mode change is registered. This results in a very jarring and frustrating
# transition between modes. Let's reduce this delay to 0.1 seconds
export KEYTIMEOUT=1
