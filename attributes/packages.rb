# packages.rb attributes

default['workstation']['packages']['homebrew']['taps'] = [
  'caskroom/cask',
  'homebrew/completions',
  'homebrew/dupes'
]

default['workstation']['packages']['homebrew']['pkgs'] = [
  'ack',
  'amazon-ecs-cli',
  'apm-bash-completion',
  'awscli',
  'bash-completion',
  'bash-git-prompt',
  'brew-cask-completion',
  'bundler-completion',
  'coreutils',
  'ctags',
  'docker-completion',
  'docker-compose-completion',
  'gem-completion',
  'grep',
  'hub',
  'jsonlint',
  'launchctl-completion',
  'kitchen-completion',
  'macvim',
  'mas',
  'npm',
  'open-completion',
  'packer',
  'packer-completion',
  'pandoc',
  'pip-completion',
  'python',
  'python3',
  'rake-completion',
  'rbenv',
  'rbenv-binstubs',
  'rbenv-bundle-exec',
  'rbenv-bundler',
  'rbenv-use',
  'ruby-completion',
  'ruby-build',
  'the_silver_searcher',
  'terraform',
  'tmate',
  'todo-txt',
  'vagrant-completion',
  'vim',
  'watch'
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
  'inkscape',
  'istat-menus',
  'iterm2',
  'kindle',
  'kitematic',
  'microsoft-office',
  'nosleep',
  'postman',
  'scribus',
  'skype',
  'slack',
  'spectacle',
  'todotxt',
  'utorrent',
  'vagrant',
  'virtualbox',
  'virtualbox-extension-pack',
  'xquartz',
  'yakyak',
  'zoomus'
]
