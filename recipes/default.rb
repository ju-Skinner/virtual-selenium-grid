#
# Cookbook Name:: virtual-selenium-grid
# Recipe:: default
#
# Copyright (C) 2015 Julian Skinner
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'java::default'
include_recipe 'selenium'

selenium_hub 'selenium_hub' do
  port 4440
  action :install
end
