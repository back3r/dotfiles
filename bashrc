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

eval "$(thefuck --alias)"
eval "$(fzf --bash)"
eval -- "$(/usr/bin/starship init bash --print-full-init)"

# alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ls='eza'
alias dirs='dirs -v'
alias cd='pushd'

PS1='[\u@\h \W]\$ '

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
