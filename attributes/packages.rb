# packages.rb attributes

default['workstation']['packages']['homebrew']['taps'] = [
  'caskroom/cask',
  'homebrew/completions',
  'homebrew/dupes'
]

default['workstation']['packages']['homebrew']['pkgs'] = [
  'ansible',
  'awscli',
  'bash-git-prompt',
  'coreutils',
  'grep',
  'packer',
  'python3',
  'bash-completion',
  'apm-bash-completion',
  'bash-completion',
  'brew-cask-completion',
  'docker-completion',
  'docker-compose-completion',
  'docker-machine-completion',
  'gem-completion',
  'kitchen-completion',
  'packer-completion',
  'pip-completion',
  'rake-completion',
  'ruby-completion',
  'vagrant-completion'
]

default['workstation']['packages']['homebrew']['casks'] = [
  'atom',
  'box-sync',
  'caffeine',
  'chefdk',
  'daisydisk',
  'flash',
  'flux',
  'google-chrome',
  'google-drive',
  'istat-menus',
  'iterm2',
  'keepassx',
  'microsoft-office',
  'nosleep',
  'skype',
  'slack',
  'spectacle',
  'vagrant',
  'virtualbox',
  'virtualbox-extension-pack'
]
