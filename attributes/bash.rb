# bash.rb attributes

default['workstation']['shell']['bash']['dot_files'] = [
  '.bash_profile',
  '.bashrc'
]

default['workstation']['shell']['bash']['profile_d_files'] = [
  'bash_colors.sh',
  'bash_completion.sh',
  'chefdk.sh'
]
