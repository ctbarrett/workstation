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
