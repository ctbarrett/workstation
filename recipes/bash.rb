#
# Cookbook Name:: workstation
# Recipe:: bash
#
# Copyright (c) 2016 Craig Barrett, All Rights Reserved.

# Get user info for current user
# TODO: refactor to use external method of setting user attributes
require 'etc'
curr_user = Etc.getpwnam(Etc.getlogin)
curr_group = Etc.getgrgid(curr_user['gid'])
user = curr_user['name']
group = curr_group['name']
home = curr_user['dir']

directory "#{home}/.profile.d" do
  owner user
  group group
  mode '0700'
  action :create
end

node['workstation']['shell']['bash']['dot_files'].each do |file|
  cookbook_file "#{home}/#{file}" do
    source "bash/#{file}"
    owner user
    group group
    mode '0600'
  end
end

node['workstation']['shell']['bash']['profile_d_files'].each do |file|
  cookbook_file "#{home}/.profile.d/#{file}" do
    source "bash/.profile.d/#{file}"
    owner user
    group group
    mode '0700'
  end
end

node['workstation']['shell']['bash']['profile_d_templates'].each do |file|
  template "#{home}/.profile.d/#{file}" do
    source "bash/.profile.d/#{file}.erb"
    owner user
    group group
    mode '0700'
  end
end
