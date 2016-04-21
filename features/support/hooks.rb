require 'appium_lib'

Before do |scenario|

  Utilities::load_device_descriptor

  case ENV['TARGET']
    when 'local'
      capabilities = Utilities.local_capabilities(scenario.name)
    when 'sauce'
      capabilities = Utilities.sauce_capabilities(scenario.name)
    else
      capabilities = Utilities.local_capabilities(scenario.name)
  end

  @appium = Appium::Driver.new(capabilities)
  Appium.promote_appium_methods RSpec::Core::ExampleGroup
  @appium.start_driver
end

After do |scenario|
  if ENV['TARGET'] == 'sauce'
    Utilities.sauce_update_job_success(@appium,!scenario.failed?)
  end
  @appium.driver_quit
end