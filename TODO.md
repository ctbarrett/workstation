# TODO File

This file contains a description of the manual changes not yet implemented via chef. Hopefully by the time it becomes
obsolete, the overall workflow will be sufficiently mature that it is relatively trivial to add new settings/apps.

## Files/Directories

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

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
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

-   chef/chefdk

-   homebrew

    -   awscli
    -   bash-git-prompt
    -   coreutils
    -   homebrew/dupes/grep
    -   packer
    -   python3


-   homebrew-cask

    -   atom
    -   box-sync
    -   caffeine
    -   flash
    -   flux
    -   google-chrome
    -   google-drive
    -   istat-menus
    -   iterm2
    -   keepassx
    -   microsoft-office
    -   nosleep
    -   skype
    -   slack
    -   spectacle
    -   vagrant
    -   virtualbox
    -   virtualbox-extension-pack


-   app store / buy

    -   iStat Menus
    -   Daisy Disk
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

## Vagrant box

To enable future automation and testing, the [osx-vm-templates](https://github.com/timsutton/osx-vm-templates) project
was used, as outlined in [this article](https://spin.atomicobject.com/2015/11/17/vagrant-osx/).

## Chef client

Chef-DK was installed via [chefdk-bootstrap](https://github.com/Nordstrom/chefdk_bootstrap) to provide the required
chef-client installation. To simplify things for now, I'll use chef-zero, but ultimately may decide to switch to some
form of Chef Server.
