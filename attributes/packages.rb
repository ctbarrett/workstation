# packages.rb attributes

default['workstation']['packages']['homebrew']['taps'] = [
  'caskroom/cask',
  'homebrew/completions',
  'homebrew/dupes'
]

default['workstation']['packages']['homebrew']['pkgs'] = [
  'awscli',
  'bash-git-prompt',
  'coreutils',
  'grep',
  'packer',
  'python3'
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
