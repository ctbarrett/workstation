#
# Cookbook Name:: workstation
# Recipe:: packages
#
# Copyright (c) 2016 Craig Barrett, All Rights Reserved.

include_recipe 'homebrew'

node['workstation']['packages']['homebrew']['taps'].each do |tap|
  homebrew_tap tap
end

node['workstation']['packages']['homebrew']['pkgs'].each do |pkg|
  homebrew_package pkg
end

node['workstation']['packages']['homebrew']['casks'].each do |cask|
  homebrew_cask cask
end
