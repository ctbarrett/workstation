# bash.rb attributes

default['workstation']['shell']['bash']['dot_files'] = [
  '.bash_profile',
  '.bashrc',
  '.git-prompt-colors.sh'
]

default['workstation']['shell']['bash']['profile_d_files'] = [
  'bash_colors.sh',
  'bash_completion.sh',
  'bash_prompt.sh',
  'chefdk.sh'
]

default['workstation']['shell']['bash']['profile_d_templates'] = [
  'git.sh'
]
