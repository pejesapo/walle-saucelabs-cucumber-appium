require 'appium_lib'
include AppiumConfig

Before do |scenario|
  case ENV['target']
    when 'local'
      @appium = Appium::Driver.new(local_capabilities(scenario.name))
    when 'sauce'
      @appium = Appium::Driver.new(sauce_capabilities(scenario.name))
    else
      @appium = Appium::Driver.new(local_capabilities(scenario.name))
  end
  Appium.promote_appium_methods RSpec::Core::ExampleGroup
  @appium.start_driver

end

After do |scenario|
  if ENV['target'] == 'sauce'
    sauce_update_job_success(!scenario.failed?)
  end
  @appium.driver_quit
end