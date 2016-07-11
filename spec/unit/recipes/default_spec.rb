#
# Cookbook Name:: workstation
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

RSpec.describe 'workstation::default' do
  context 'When all attributes are default' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
      stub_command('which git').and_return('/opt/chefdk/embedded/bin/git')
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    %w(bash home packages).each do |recipe|
      it "includes workstation::#{recipe}" do
        expect(chef_run).to include_recipe("workstation::#{recipe}")
      end
    end
  end
end
