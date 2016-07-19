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
      ansible
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
      it "installs homebrew package #{pkg}" do
        expect(chef_run).to install_homebrew_package(pkg.to_s)
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
      it "installs homebrew cask #{cask}" do
        expect(chef_run).to install_homebrew_cask(cask.to_s)
      end
    end
  end
end
