# Aliases
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gh='log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias go='git checkout'
alias gs='git status'

# Homebrew github token
export HOMEBREW_GITHUB_API_TOKEN='64c38415c0a211355df3e701074bea0a9d4242f1'

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
