# Homebrew taps
%w(
  caskroom/cask
  homebrew/completions
  homebrew/dupes
).each do |tap|
  describe command("brew tap # verify homebrew_tap #{tap}") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/^#{tap}/) }
  end
end

# Homebrew packages
%w(
  ansible
  apm-bash-completion
  awscli
  bash-completion
  bash-git-prompt
  brew-cask-completion
  coreutils
  docker-completion
  docker-compose-completion
  docker-machine-completion
  gem-completion
  grep
  lastpass-cli
  kitchen-completion
  mas
  packer
  packer-completion
  pip-completion
  python3
  rake-completion
  ruby-completion
  vagrant-completion
).each do |pkg|
  describe package(pkg.to_s) do
    it { should be_installed }
  end
end

# Homebrew casks
%w(
  atom
  box-sync
  caffeine
  chefdk
  daisydisk
  flash
  flux
  google-chrome
  google-drive
  istat-menus
  iterm2
  keepassx
  lastpass
  microsoft-office
  nosleep
  skype
  slack
  spectacle
  vagrant
  virtualbox
  virtualbox-extension-pack
  yakyak
  zoomus
).each do |cask|
  describe bash("brew cask info #{cask}") do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not match(/Not installed/) }
    its('stdout') { should match(/^#{cask}: \S+/) }
    its('stdout') { should match(%r{^/usr/local/Caskroom/#{cask}/}) }
  end
end
