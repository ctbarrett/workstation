# packages.rb attributes

default['workstation']['packages']['homebrew']['taps'] = [
  'caskroom/cask',
  'homebrew/completions',
  'homebrew/dupes'
]

default['workstation']['packages']['homebrew']['pkgs'] = [
  'ansible',
  'apm-bash-completion',
  'awscli',
  'bash-completion',
  'bash-git-prompt',
  'brew-cask-completion',
  'coreutils',
  'docker-completion',
  'docker-compose-completion',
  'docker-machine-completion',
  'gem-completion',
  'grep',
  'lastpass-cli',
  'kitchen-completion',
  'mas',
  'packer',
  'packer-completion',
  'pip-completion',
  'python3',
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
  'lastpass',
  'microsoft-office',
  'nosleep',
  'skype',
  'slack',
  'spectacle',
  'vagrant',
  'virtualbox',
  'virtualbox-extension-pack',
  'zoomus'
]
