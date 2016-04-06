#
# Cookbook Name:: teletraan
# Recipe:: default
#
# Copyright 2016, Endticket Inc.
#
# All rights reserved - Do Not Redistribute
#



package 'gzip' do
  action :install
end

package 'tar' do
  action :install
end

user 'teletraan' do
  action :create
  comment 'teletraan'
  home '/opt/deploy-service'
  shell '/bin/bash'
  supports :manage_home => true
end


include_recipe 'teletraan::deploy-service'
include_recipe 'teletraan::deploy-board'

