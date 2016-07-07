# TODO File

This file contains a description of the manual changes not yet implemented via chef. Hopefully by the time it becomes
obsolete, the overall workflow will be sufficiently mature that it is relatively trivial to add new settings/apps.

## Files/Directories

### ~/.profile.d

#### bash_completion.sh

```bash
# Configure extra shell command completions
complete -C aws_completer aws
```

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

#### chefdk.sh

```bash
eval "$(chef shell-init bash)"
```

#### bash_colors.sh

```bash
# Sourced from: https://gist.github.com/scottweaver/3278629
# Reference: https://wiki.archlinux.org/index.php/Color_Bash_Prompt

# Reset
Color_Off='\[\e[0m\]'       # Text Reset
Reset='\[\e[0m\]'           # Text Reset

# Regular Colors
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White

# Bold
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White

# Underline
UBlack='\[\e[4;30m\]'       # Black
URed='\[\e[4;31m\]'         # Red
UGreen='\[\e[4;32m\]'       # Green
UYellow='\[\e[4;33m\]'      # Yellow
UBlue='\[\e[4;34m\]'        # Blue
UPurple='\[\e[4;35m\]'      # Purple
UCyan='\[\e[4;36m\]'        # Cyan
UWhite='\[\e[4;37m\]'       # White

# Background
On_Black='\[\e[40m\]'       # Black
On_Red='\[\e[41m\]'         # Red
On_Green='\[\e[42m\]'       # Green
On_Yellow='\[\e[43m\]'      # Yellow
On_Blue='\[\e[44m\]'        # Blue
On_Purple='\[\e[45m\]'      # Purple
On_Cyan='\[\e[46m\]'        # Cyan
On_White='\[\e[47m\]'       # White

# High Intensity
IBlack='\[\e[0;90m\]'       # Black
IRed='\[\e[0;91m\]'         # Red
IGreen='\[\e[0;92m\]'       # Green
IYellow='\[\e[0;93m\]'      # Yellow
IBlue='\[\e[0;94m\]'        # Blue
IPurple='\[\e[0;95m\]'      # Purple
ICyan='\[\e[0;96m\]'        # Cyan
IWhite='\[\e[0;97m\]'       # White

# Bold High Intensity
BIBlack='\[\e[1;90m\]'      # Black
BIRed='\[\e[1;91m\]'        # Red
BIGreen='\[\e[1;92m\]'      # Green
BIYellow='\[\e[1;93m\]'     # Yellow
BIBlue='\[\e[1;94m\]'       # Blue
BIPurple='\[\e[1;95m\]'     # Purple
BICyan='\[\e[1;96m\]'       # Cyan
BIWhite='\[\e[1;97m\]'      # White

# High Intensity backgrounds
On_IBlack='\[\e[0;100m\]'   # Black
On_IRed='\[\e[0;101m\]'     # Red
On_IGreen='\[\e[0;102m\]'   # Green
On_IYellow='\[\e[0;103m\]'  # Yellow
On_IBlue='\[\e[0;104m\]'    # Blue
On_IPurple='\[\e[10;95m\]'  # Purple
On_ICyan='\[\e[0;106m\]'    # Cyan
On_IWhite='\[\e[0;107m\]'   # White
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
