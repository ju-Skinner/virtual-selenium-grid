include_recipe 'windows::default'
include_recipe 'java'

include_recipe 'firefox::default'
include_recipe 'chrome::default'

selenium_node 'selenium_node' do
  username 'vagrant' if platform?('windows')
  password 'vagrant' if platform?('windows')
  hubPort 4440
  hubHost 'selenium.local'
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
    },
    {
      browserName: 'internet explorer',
      maxInstances: 1,
      seleniumProtocol: 'WebDriver'
    }
  ]
  action :install
end