# TODO File

This file contains a description of the manual changes not yet implemented via chef. Hopefully by the time it becomes
obsolete, the overall workflow will be sufficiently mature that it is relatively trivial to add new settings/apps.

## Files/Directories

### ~/.vimrc

Add chef code to setup .vimrc (vim cookbook?)

### ~/.profile.d

#### git.sh

```bash
# Aliases
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gh='log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias go='git checkout'
alias gs='git status'

# Homebrew github token
export HOMEBREW_GITHUB_API_TOKEN='...'
```

### ~/.gitconfig

```ini
[user]
  email = email@example.com
  name = Swedish Chef
[push]
  default = simple
```

### /etc/sudoers

```bash
$ sudo grep admin /etc/sudoers
%admin  ALL=(ALL) NOPASSWD: ALL
```

## Software

-   app store / buy

    -   Magnet

-   gems

    -   iesd
    -   rubocop


-   atom

    -   ex-mode
    -   linter
    -   linter-foodcritic
    -   linter-markdown
    -   linter-rubocop
    -   markdown-scroll-sync
    -   minimap
    -   minimap-linter
    -   monokai-seti
    -   seti-ui
    -   seti-syntax
    -   vim-mode
