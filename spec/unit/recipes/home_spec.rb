#
# Cookbook Name:: workstation
# Spec:: home
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

RSpec.describe 'workstation::home' do
  context 'When all attributes are default' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    user_home = '/Users/craig'

    # TODO: Add mocks with test values for Etc methods

    %w(.profile.d src).each do |subdir|
      it "creates ~/#{subdir}" do
        expect(chef_run).to create_directory("#{user_home}/#{subdir}").with(
          owner: 'craig',
          group: 'staff',
          mode: '0700'
        )
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
