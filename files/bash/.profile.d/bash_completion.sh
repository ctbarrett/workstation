# Configure homebrew bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Configure extra shell command completions
complete -C aws_completer aws
