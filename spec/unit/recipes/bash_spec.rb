#
# Cookbook Name:: workstation
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

RSpec.describe 'workstation::bash' do
  context 'When all attributes are default' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates .bash_profile' do
      expect(chef_run).to create_cookbook_file('/Users/craig/.bash_profile').with(
        owner: 'craig',
        group: 'staff',
        mode: '0644'
      )
    end
  end
end
