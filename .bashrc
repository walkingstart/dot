#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
if [ -f ~/.aliasrc ]; then
    . ~/.aliasrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
