# TODO File

This file contains a description of the manual changes not yet implemented via chef. Hopefully by the time it becomes
obsolete, the overall workflow will be sufficiently mature that it is relatively trivial to add new settings/apps.

## Files/Directories

### .bashrc

```bash
# Shell basics
export HISTFILE=~/.bash_history
export PATH=~/bin:$PATH
set -o vi
shopt -s histappend

# Aliases
alias ll='ls -l'

# Include per-app shell configs
if [[ -d ~/.profile.d ]]
then
  for i in ~/.profile.d/*.sh; do [[ -r ${i} ]] && . ${i}; done
  unset i
else
  mkdir ~/.profile.d
fi
```

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

#### chefdk.sh

```bash
eval "$(chef shell-init bash)"
```

### ~/.gitrc

```ini
[user]
  email = email@example.com
  name = Swedish Chef
```

### ~/src

Used to hold source files and development projects. Contains subdirectories for scripts and cookbooks.

### /etc/sudoers

```bash
$ sudo grep admin /etc/sudoers
%admin  ALL=(ALL) NOPASSWD: ALL
```

## Software

-   chef/chefdk

-   homebrew

    -   packer


-   homebrew-cask

    -   atom
    -   caffeine
    -   flash
    -   google-chrome
    -   google-drive
    -   iterm2
    -   keepassx
    -   nosleep
    -   skype
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

    -   vim-mode
    -   ex-mode
    -   markdown-scroll-sync
    -   linter
    -   linter-rubocop
    -   linter-foodcritic
    -   linter-markdown

## Vagrant box

To enable future automation and testing, the [osx-vm-templates](https://github.com/timsutton/osx-vm-templates) project
was used, as outlined in [this article](https://spin.atomicobject.com/2015/11/17/vagrant-osx/).

## Chef client

Chef-DK was installed via [chefdk-bootstrap](https://github.com/Nordstrom/chefdk_bootstrap) to provide the required
chef-client installation. To simplify things for now, I'll use chef-zero, but ultimately may decide to switch to some
form of Chef Server.
