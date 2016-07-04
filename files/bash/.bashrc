# Shell basics
export HISTFILE=~/.bash_history
export PATH=~/bin:$PATH
set -o vi
shopt -s histappend

# Aliases
alias ls='ls -GFh '
alias ll='ls -l '

# Include per-app shell configs
if [[ -d ~/.profile.d ]]
then
  for i in ~/.profile.d/*.sh; do [[ -r ${i} ]] && . ${i}; done
  unset i
else
  mkdir ~/.profile.d
fi

# Terminal colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto'
