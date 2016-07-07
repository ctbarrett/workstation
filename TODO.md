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

#### bash_prompt.sh

```bash
if [[ -f ~/.profile.d/bash_colors.sh ]]
then
source ~/.profile.d/bash_colors.sh
cldef=true
fi

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

set_cl_prompt () {
    Last_Command=$? # Must come first!
    PS1=""
    FancyX='\342\234\227'
    Checkmark='\342\234\223'

    # Start with a leading newline to separate prompt from last command output
    #PS1+="\\n"

    # If last command was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="\\[$Green\\]$Checkmark "
    else
        PS1+="\\[$Red\\]$FancyX "
    fi

    # Print the current time in square brackets
    #PS1+="\\[$Cyan\\][ \\[$Green\\]\t \\[$Cyan\\]] "

    # Print the current user in red, a cyan @ separator and (short) hostname in green
    PS1+="\\[$Red\\]\\u\\[$Cyan\\]@\\[$Green\\]\\h"

    # Print the working directory in yellow, git branch (if available) in Blue,
    # and prompt marker in cyan, then reset the text color to the default.
    PS1+="\\[$Cyan\\]:\\[$Yellow\\]\\W\\[$Blue\\]$git_prompt\\[$Cyan\\]\\ \$\\[$Reset\\] "
}

if [[ $cldef == "true" ]]
then
PROMPT_COMMAND='history -a; history -n; set_cl_prompt'
export PS1
else
PROMPT_COMMAND="history -a; history -n"
export PS1="\u@\h:\w \$ "
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

    -   awscli
    -   bash-git-prompt
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
