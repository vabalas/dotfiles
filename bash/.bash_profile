#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


#export PATH=$PATH":$HOME/.scripts"
export TERMINAL="termite"
export BROWSER="firefox"

# whenever I login do:
if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || startx
fi

