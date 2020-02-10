#
# ~/.bashrc
#

## Shell settings =================================================
# Provide a list of dirs to check successively for matching subdirs
export CDPATH=.:~

# Path settings
export PATH=$HOME/.local/bin:$HOME/Software/Scripts:$PATH

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='emacsclient -c'
fi

# Tolerate typos
shopt -s cdspell
# Linewrap
shopt -s checkwinsize

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


## Keybindings ====================================================
# Tab complete - automatically cycle through options
bind '"\t":menu-complete'


## Functions ======================================================
# Emacs cTags - create TAGS index file
create_etags () {
 #"*.[ch]"
    find . -type f -iname "*.[ch]" | xargs etags -a
}

# Color man output
man () {
    env \
    LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
    LESS_TERMCAP_md="$(printf "\e[1;31m")" \
    LESS_TERMCAP_me="$(printf "\e[0m")" \
    LESS_TERMCAP_se="$(printf "\e[0m")" \
    LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
    LESS_TERMCAP_ue="$(printf "\e[0m")" \
    LESS_TERMCAP_us="$(printf "\e[1;32m")" \
    man "${@}"
}

## Aliases ========================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='ls --color=auto'
alias ll='ls -alhS --color=auto'

alias .t='thunar ./ & disown'

alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias clp='xclip -sel clip'

## Prompt =========================================================
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# How many directories to show before ellipsis.
PROMPT_DIRTRIM=2

# Prompt format ezprompt.net
PS1='\[\e[1m\]\[\e[34m\]\w\[\e[39m\]\[\e[33m\] \$ \[\e[34m\]\h\[\e[31m\] ? \[\e[0m\e[39m\]'
PS2='\[\e[31m\]:> \[\e[39m\]'


## 8dev ===========================================================
#WRT builder docker
wb () {
    PARAMS=""
    [[ -n $1 ]] && PARAMS="-c \"$@\""
    eval "docker run -h wrt_builder -v $PWD:/home/baker/${PWD##*/} --rm -it wrt_baker:latest /bin/bash -c 'cd /home/baker/${PWD##*/}; exec /bin/bash $PARAMS'"
}
