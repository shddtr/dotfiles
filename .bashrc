export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=100000
shopt -s histappend
shopt -s checkwinsize

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export PS1="\[\e]0;\u@\h: \w\a\]$PS1"

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
