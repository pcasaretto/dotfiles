# completion system
COMPDUMPFILE=${COMPDUMPFILE:-${ZDOTDIR:-${HOME}}/.zcompdump}
if autoload compinit ; then
  compinit -d ${COMPDUMPFILE} || print 'Notice: no compinit available :('
else
  print 'Notice: no compinit available :('
  function compdef { }
fi

# completion system

# note: use 'zstyle' for getting current settings
#         press ^xh (control-x h) for getting tags in context; ^x? (control-x ?) to run complete_debug with trace output

# Make sure the completion system is initialised
(( ${+_comps} )) || return 1

# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:'    max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'

# don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(aptitude-*|*\~)'

# start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*'       insert-unambiguous true
# zstyle ':completion:*:corrections'     format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*'       original true

# activate color-completion
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}

# format on completion
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

# automatically complete 'cd -<tab>' and 'cd -<ctrl-d>' with menu
# zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# insert all expansions for expand completer
zstyle ':completion:*:expand:*'        tag-order all-expansions
zstyle ':completion:*:history-words'   list false

# activate menu
zstyle ':completion:*:history-words'   menu yes

# ignore duplicate entries
zstyle ':completion:*:history-words'   remove-all-dups yes
zstyle ':completion:*:history-words'   stop yes

# match uppercase from lowercase
zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'

# separate matches into groups
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''

zstyle ':completion:*'                 menu select=5

zstyle ':completion:*:messages'        format '%d'
zstyle ':completion:*:options'         auto-description '%d'

# describe options in full
zstyle ':completion:*:options'         description 'yes'

# on processes completion complete all user processes
zstyle ':completion:*:processes'       command 'ps -au$USER'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# provide verbose completion information
zstyle ':completion:*'                 verbose true

# recent (as of Dec 2007) zsh versions are able to provide descriptions
# for commands (read: 1st word in the line) that it will list for the user
# to choose from. The following disables that, because it's not exactly fast.
zstyle ':completion:*:-command-:*:'    verbose false

# set format for warnings
zstyle ':completion:*:warnings'        format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'

# define files to ignore for zcompile
zstyle ':completion:*:*:zcompile:*'    ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:'          prompt 'correct to: %e'

# Ignore completion functions for commands you don't have:
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'

# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'

# complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

# Search path for sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
  /usr/local/bin  \
  /usr/sbin       \
  /usr/bin        \
  /sbin           \
  /bin            \
  /usr/X11R6/bin

# provide .. as a completion
zstyle ':completion:*' special-dirs ..

# run rehash on completion so new installed program are found automatically:
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1
}

## correction
# some people don't like the automatic correction - so run 'NOCOR=1 zsh' to deactivate it
if [[ "$NOCOR" -gt 0 ]] ; then
  zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _files _ignored
  setopt nocorrect
else
  # try to be smart about when to use what completer...
  setopt correct
  zstyle -e ':completion:*' completer '
  if [[ $_last_try != "$HISTNO$BUFFER$CURSOR" ]] ; then
    _last_try="$HISTNO$BUFFER$CURSOR"
    reply=(_complete _match _ignored _prefix _files)
  else
    if [[ $words[1] == (rm|mv) ]] ; then
      reply=(_complete _files)
    else
      reply=(_oldlist _expand _force_rehash _complete _ignored _correct _approximate _files)
    fi
  fi'
fi

# command for process lists, the local web server details and host completion
zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'

# Some functions, like _apt and _dpkg, are very slow. We can use a cache in
# order to speed things up
if [[ ${GRML_COMP_CACHING:-yes} == yes ]]; then
  GRML_COMP_CACHE_DIR=${GRML_COMP_CACHE_DIR:-${ZDOTDIR:-$HOME}/.cache}
  if [[ ! -d ${GRML_COMP_CACHE_DIR} ]]; then
    command mkdir -p "${GRML_COMP_CACHE_DIR}"
  fi
  zstyle ':completion:*' use-cache  yes
  zstyle ':completion:*:complete:*' cache-path "${GRML_COMP_CACHE_DIR}"
fi

# host completion
_ssh_config_hosts=()
_ssh_hosts=()
_etc_hosts=()
hosts=(
$(hostname)
"$_ssh_config_hosts[@]"
"$_ssh_hosts[@]"
"$_etc_hosts[@]"
localhost
)
zstyle ':completion:*:hosts' hosts $hosts
# use generic completion system for programs not yet defined; (_gnu_generic works
# with commands that provide a --help option with "standard" gnu-like output.)
for compcom in cp deborphan df feh fetchipac gpasswd head hnb ipacsum mv \
  pal stow uname ; do
[[ -z ${_comps[$compcom]} ]] && compdef _gnu_generic ${compcom}
    done; unset compcom

    # see upgrade function in this file
    compdef _hosts upgrade
