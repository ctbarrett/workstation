#
# Cookbook Name:: workstation
# Recipe:: default
#
# Copyright (c) 2016 Craig Barrett, All Rights Reserved.

include_recipe "#{cookbook_name}::home"
include_recipe "#{cookbook_name}::bash"
include_recipe "#{cookbook_name}::packages"
