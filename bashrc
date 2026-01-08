#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM='xterm-256color'
# export TERMINAL='foot'
export VISUAL='nvim'
export EDITOR='nvim'
export BROWSER='firefox'
export VISUAL_EDIT='nvim'
export SUDO_EDIT='nvim'
export FILEMANAGER='nautilus'
export HISTFILE="$HOME/.bash_history"

export PATH="$HOME/.local/bin:$PATH"

# ~/.bashrc
[ -f ~/.local/bin/yazi_fn.sh ] && source ~/.local/bin/yazi_fn.sh

# eval "$(thefuck --alias)"
eval "$(fzf --bash)"
# eval -- "$(/usr/bin/starship init bash --print-full-init)"
eval "$(zoxide init --cmd="cd" bash)"
eval "$(niri completions bash)"

# alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ls='eza'
alias ll='eza -lh'
alias la='eza -A'
alias grep='grep --color=auto'
alias steam='steam -no-cef-sandbox -cef-disable-gpu'

# alias dirs='dirs -v'
# alias cd='pushd'
alias vimwiki='nvim $HOME/wimwiki/index.md'
alias prox="ssh proxmox"

HISTSIZE=5000
HISTFILESIZE=10000
HISTTIMEFORMAT="%F %T "
# HISTCONTROL=ignoredups:erasedups:ignorespace
HISTCONTROL=ignoredups:erasedups
HISTIGNORE="ls:cd:pwd:exit:date:clear"

shopt -s histappend

PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# PS1='[\u@\h \W]\$ '
PS1='\[\e[38;5;109m\]\u@\h \[\e[38;5;67m\]\w\[\e[0m\] \$ '

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
