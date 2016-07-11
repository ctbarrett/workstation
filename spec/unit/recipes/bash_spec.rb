#
# Cookbook Name:: workstation
# Spec:: bash
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

RSpec.describe 'workstation::bash' do
  context 'When all attributes are default' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
      stub_command('which git').and_return('/opt/chefdk/embedded/bin/git')
    end

    user_home = '/Users/craig'

    # TODO: Add mocks with test values for Etc methods
    # TODO: Add mock value for github token / (future) data bag items

    it 'creates ~/.profile.d' do
      expect(chef_run).to create_directory("#{user_home}/.profile.d").with(
        owner: 'craig',
        group: 'staff',
        mode: '0700'
      )
    end

    %w(.bash_profile .bashrc).each do |dot_file|
      it "creates ~/#{dot_file}" do
        expect(chef_run).to create_cookbook_file("#{user_home}/#{dot_file}").with(
          owner: 'craig',
          group: 'staff',
          mode: '0600'
        )
      end
    end

    %w(bash_colors.sh bash_completion.sh bash_prompt.sh bash-git-prompt.sh chefdk.sh).each do |file|
      it "creates ~/.profile.d/#{file}" do
        expect(chef_run).to create_cookbook_file("#{user_home}/.profile.d/#{file}").with(
          owner: 'craig',
          group: 'staff',
          mode: '0700'
        )
      end
    end

    %w(git.sh).each do |template|
      it "creates ~/.profile.d/#{template}" do
        expect(chef_run).to expand_template("#{user_home}/.profile.d/#{template}").with(
          variables: { git_token => 'github_token_string' }
        )
      end
    end
  end
end
