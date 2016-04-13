require 'watir-webdriver'
require 'appium_lib'

def sauce_capabilities
  {
      'appium-version' => '1.3.7',
      #'app' => 'sauce-storage:PlainNote.zip',
      'app' => 'http://appium.s3.amazonaws.com/TestApp7.1.app.zip',
      'device' => 'iPhone Simulator',
      'username' => 'willydelacruzef',
      'access-key' => '53e674f7-6a0a-4f99-ad23-65b7412fe1a6',
      'platform' => 'iOS',
      'version' => '8.0',
      'name' => 'walle-saucelabs-cucumber-appium',
      'passed' => 'true',
  }
end

def sauce_url
  "http://willydelacruzef:53e674f7-6a0a-4f99-ad23-65b7412fe1a6@ondemand.saucelabs.com:80/wd/hub"
end

def ios_native_local_capabilities
  {
      caps: {
          platformName: "iOS",
          platformVersion: "9.3",
          deviceName: "iPhone 6",
          app: "http://appium.s3.amazonaws.com/TestApp7.1.app.zip",
          name: "Basic iOS Native Test",
      }
  }
end

def ios_hybrid_local_capabilities
  {
      caps: {
          platformName: "iOS",
          platformVersion: "9.3",
          deviceName: "iPhone 6",
          app: "http://appium.s3.amazonaws.com/WebViewApp7.1.app.zip",
          name: "Basic iOS hybrid Test",
      }
  }
end


Before do
  # case ENV['TYPE']
  # when 'hybrid'
  #   @appium = Appium::Driver.new(ios_hybrid_local_capabilities)
  # when 'native'
  #@appium = Appium::Driver.new(sauce_capabilities)
  # else
  @appium = Selenium::WebDriver.for(:remote, :desired_capabilities => sauce_capabilities, :url => sauce_url)
  puts 's'
  # end

  @appium.start_driver
end


After do
  @appium.driver_quit
end