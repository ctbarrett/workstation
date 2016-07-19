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
  awscli
  bash-git-prompt
  coreutils
  grep
  packer
  python3
  bash-completion
  apm-bash-completion
  bash-completion
  brew-cask-completion
  docker-completion
  docker-compose-completion
  docker-machine-completion
  gem-completion
  kitchen-completion
  packer-completion
  pip-completion
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
  microsoft-office
  nosleep
  skype
  slack
  spectacle
  vagrant
  virtualbox
  virtualbox-extension-pack
).each do |cask|
  describe bash("brew cask info #{cask}") do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not match(/Not installed/) }
    its('stdout') { should match(/^#{cask}: \S+/) }
    its('stdout') { should match(%r{^/usr/local/Caskroom/#{cask}/}) }
  end
end
