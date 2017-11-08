export ZSH=$HOME/.oh-my-zsh

# Config
ZSH_THEME="frisk"
plugins=(custom git node osx postgres rbenv z zsh-syntax-highlighting)

# System
export EDITOR="/usr/bin/vim"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# Aliases
alias ll='ls -al'
alias gt='git status'
alias go='git checkout'
alias gh="git log --format='%h %ad | %s%d [%an]' --graph --date=short"
alias atom="open -a '/Applications/Atom.app'"
alias rake="noglob rake
