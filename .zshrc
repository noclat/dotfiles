export ZSH=$HOME/.oh-my-zsh

# Config
ZSH_THEME="frisk"
plugins=(git atom thf)

# System
export EDITOR="/usr/bin/vim"
export PATH="/usr/local/php5/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# Aliases
alias gt='git status'
alias go='git checkout'
alias poule='git pull'
