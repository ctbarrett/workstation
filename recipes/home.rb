#
# Cookbook Name:: workstation
# Recipe:: home
#
# Copyright (c) 2016 Craig Barrett, All Rights Reserved.

# Get user info for current user
require 'etc'
curr_user = Etc.getpwnam(Etc.getlogin)
curr_group = Etc.getgrgid(curr_user['gid'])
user = curr_user['name']
group = curr_group['name']
home = curr_user['dir']

node['workstation']['home']['subdirectories'].each do |directory|
  directory "#{home}/#{directory}" do
    owner user
    group group
    mode '0700'
    action :create
  end
end
