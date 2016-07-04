#
# Cookbook Name:: workstation
# Spec:: bash
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

RSpec.describe 'workstation::bash' do
  context 'When all attributes are default' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    user_home = '/Users/craig'

    # TODO: Add mocks with test values for Etc methods
    # TODO: Add mock value for github token / (future) data bag items

    %w(.bash_profile .bashrc).each do |bash_file|
      it "creates ~/#{bash_file}" do
        expect(chef_run).to create_cookbook_file("#{user_home}/#{bash_file}").with(
          owner: 'craig',
          group: 'staff',
          mode: '0644'
        )
      end
    end

    it 'creates ~/.profile.d' do
      expect(chef_run).to create_directory("#{user_home}/.profile.d").with(
        owner: 'craig',
        group: 'staff',
        mode: '0755'
      )
    end

    %w(bash_colors.sh bash_completion.sh chefdk.sh).each do |profile_d_file|
      it "creates ~/.profile.d/#{profile_d_file}" do
        expect(chef_run).to create_cookbook_file("#{user_home}/.profile.d/#{profile_d_file}").with(
          owner: 'craig',
          group: 'staff',
          mode: '0644'
        )
      end
    end

    %w(git.sh).each do |profile_d_template|
      it "creates ~/.profile.d/#{profile_d_template}" do
        expect(chef_run).to expand_template("#{user_home}/.profile.d/#{profile_d_template}").with(
          variables: { git_token => 'github_token_string' }
        )
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
