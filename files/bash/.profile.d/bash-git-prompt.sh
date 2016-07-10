##
## Default/basic/color prompt
##

if [[ -f ~/.profile.d/bash_colors.sh ]]
then
  source ~/.profile.d/bash_colors.sh
  cldef=true
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

  # Print the working directory in yellow, and prompt marker in cyan,
  # then reset the text color to the default.
  PS1+="\\[$Cyan\\]:\\[$Yellow\\]\\W\\[$Cyan\\] $\\[$Reset\\] "
}

# Set color or basic default prompt
if [[ $cldef == "true" ]]
then
  PROMPT_COMMAND='history -a; history -n; set_cl_prompt'
  export PS1
else
  PROMPT_COMMAND="history -a; history -n"
  export PS1="\u@\h:\w \$ "
fi

##
## Use Git prompt if available
##

# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme

if [[ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
