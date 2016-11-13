# packages.rb attributes

default['workstation']['packages']['homebrew']['taps'] = [
  'caskroom/cask',
  'homebrew/completions',
  'homebrew/dupes'
]

default['workstation']['packages']['homebrew']['pkgs'] = [
  'amazon-ecs-cli',
  'apm-bash-completion',
  'awscli',
  'bash-completion',
  'bash-git-prompt',
  'brew-cask-completion',
  'coreutils',
  'docker-completion',
  'docker-compose-completion',
  'gem-completion',
  'grep',
  'launchctl-completion',
  'kitchen-completion',
  'mas',
  'open-completion',
  'packer',
  'packer-completion',
  'pip-completion',
  'python',
  'python3',
  'rake-completion',
  'ruby-completion',
  'todo-txt',
  'vagrant-completion'
]

default['workstation']['packages']['homebrew']['casks'] = [
  'atom',
  'box-sync',
  'caffeine',
  'chefdk',
  'daisydisk',
  'docker',
  'dropbox',
  'enpass',
  'flash-player',
  'flux',
  'gimp',
  'google-chrome',
  'google-drive',
  'hermes',
  'istat-menus',
  'iterm2',
  'kitematic',
  'microsoft-office',
  'nosleep',
  'rescuetime',
  'skype',
  'slack',
  'spectacle',
  'todotxt',
  'utorrent',
  'vagrant',
  'virtualbox',
  'virtualbox-extension-pack'
]
