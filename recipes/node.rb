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
# include_recipe 'firefox::default'
# include_recipe 'chrome::default'

selenium_node 'selenium_node' do
  username 'vagrant' if platform?('windows')
  password 'vagrant' if platform?('windows')
  hubPort 4440
  hubHost '192.168.15.2'
  capabilities [
    {
      browserName: 'chrome',
      maxInstances: 5,
      seleniumProtocol: 'WebDriver'
    },
    {
      browserName: 'firefox',
      maxInstances: 5,
      seleniumProtocol: 'WebDriver'
    }
  ]
  action :install
end
