#
# Cookbook Name:: workstation
# Spec:: packages
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

RSpec.describe 'workstation::packages' do
  context 'When all attributes are default' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
      stub_command('which git').and_return('/opt/chefdk/embedded/bin/git')
    end

    it 'includes homebrew cookbook' do
      expect(chef_run).to include_recipe('homebrew')
    end

    # Homebrew taps
    %w(
      caskroom/cask
      homebrew/completions
      homebrew/dupes
    ).each do |tap|
      it "taps homebrew tap #{tap}" do
        expect(chef_run).to tap_homebrew_tap(tap.to_s)
      end
    end

    # Homebrew packages
    %w(
      amazon-ecs-cli
      apm-bash-completion
      awscli
      bash-completion
      bash-git-prompt
      brew-cask-completion
      coreutils
      docker-completion
      docker-compose-completion
      gem-completion
      grep
      kitchen-completion
      launchctl-completion
      mas
      open-completion
      packer
      packer-completion
      pip-completion
      python
      python3
      rake-completion
      ruby-completion
      todo-txt
      vagrant-completion
    ).each do |pkg|
      it "installs homebrew package #{pkg}" do
        expect(chef_run).to install_homebrew_package(pkg.to_s)
      end
    end

    # Homebrew casks
    %w(
      atom
      box-sync
      caffeine
      daisydisk
      docker
      flux
      gimp
      google-chrome
      google-drive
      hermes
      istat-menus
      iterm2
      kitematic
      microsoft-office
      nosleep
      skype
      slack
      spectacle
      todotxt
      utorrent
      vagrant
      virtualbox
      virtualbox-extension-pack
      zoomus
    ).each do |cask|
      it "installs homebrew cask #{cask}" do
        expect(chef_run).to install_homebrew_cask(cask.to_s)
      end
    end
  end
end
