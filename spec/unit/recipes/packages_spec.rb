#
# Cookbook Name:: workstation
# Spec:: packages
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

RSpec.describe 'workstation::packages' do
  context 'When all attributes are default' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.normal['workstation']['packages']['homebrew']['taps'] = ['feather/fall']
        node.normal['workstation']['packages']['homebrew']['casks'] = ['fizban']
        node.normal['workstation']['packages']['homebrew']['pkgs'] = ['fireball']
      end.converge(described_recipe)
    end

    before do
      stub_command('which git').and_return('/opt/chefdk/embedded/bin/git')
    end

    it 'includes homebrew cookbook' do
      expect(chef_run).to include_recipe('homebrew')
    end

    # Homebrew taps
    it 'taps valid homebrew taps' do
      expect(chef_run).to tap_homebrew_tap('feather/fall')
    end

    it 'does not tap invalid/unlisted homebrew taps' do
      expect(chef_run).to_not tap_homebrew_tap('fall/out')
    end

    # Homebrew packages
    it 'installs valid homebrew packages' do
      expect(chef_run).to install_homebrew_package('fireball')
    end

    it 'does not install invalid/unlisted homebrew packages' do
      expect(chef_run).to_not install_homebrew_package('great_balls_of_fire')
    end

    # Homebrew casks
    it 'installs valid homebrew casks' do
      expect(chef_run).to install_homebrew_cask('fizban')
    end

    it 'does not install invalid/unlisted homebrew casks' do
      expect(chef_run).to_not install_homebrew_cask('fizzbuzz')
    end
  end
end
