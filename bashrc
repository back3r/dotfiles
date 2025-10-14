#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM='foot'
export TERMINAL='foot'
export VISUAL='nvim'
export EDITOR='nvim'
export VISUAL_EDIT='nvim'
export SUDO_EDIT='nvim'
export FILEMANAGER='thunar'

export PATH="$HOME/.local/bin:$PATH"

# ~/.bashrc
[ -f ~/.local/bin/yazi_fn.sh ] && source ~/.local/bin/yazi_fn.sh

eval "$(fzf --bash)"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '
