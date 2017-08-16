export ZSH=$HOME/.oh-my-zsh

# Config
ZSH_THEME="frisk"
plugins=(git custom)

# System
export EDITOR="/usr/bin/vim"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="/usr/local/php5/bin:$PATH"
export PATH="$HOME/.npm-packages/bin:$PATH"
source $ZSH/oh-my-zsh.sh

# Aliases
alias ll='ls -al'

alias gt='git status'
alias go='git checkout'
alias gh="git log --format='%h %ad | %s%d [%an]' --graph --date=short"

# alias atom="open -a '$HOME/Applications/Atom.app'"
alias atom="open -a '/Applications/Atom.app'"
alias php.ini='atom /usr/local/php5/php.d/99-liip-developer.ini'

# Autoload
# hash mysql.server 2>/dev/null && ( mysql.server status || mysql.server start )
