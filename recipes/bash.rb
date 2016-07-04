#
# Cookbook Name:: workstation
# Recipe:: bash
#
# Copyright (c) 2016 Craig Barrett, All Rights Reserved.

# Get user info for current user
require 'etc'
curr_user = Etc.getpwnam(Etc.getlogin)
curr_group = Etc.getgrgid(curr_user['gid'])
home = curr_user['dir']

cookbook_file "#{home}/.bash_profile" do
  source 'bash/.bash_profile'
  owner curr_user['name']
  group curr_group['name']
  mode '0644'
end

cookbook_file "#{home}/.bashrc" do
  source 'bash/.bashrc'
  owner curr_user['name']
  group curr_group['name']
  mode '0644'
end
