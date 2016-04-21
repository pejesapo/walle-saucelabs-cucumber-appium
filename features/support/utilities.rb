require 'appium_lib'
require 'rest_client'
require 'yaml'

module Utilities

  def self.load_device_descriptor
    descriptor_file_name = "./config/devices/#{ENV['DEVICE']}.yml"
    @device_descriptor = nil
    if File.exist?(descriptor_file_name)
      @device_descriptor = YAML.load_file(descriptor_file_name)
    else
      fail "The following device descriptor file #{descriptor_file_name} does not exists."
    end
  end

  def self.sauce_capabilities(scenario_name)
    {caps:
         {
             'appium-version' => @device_descriptor['appium_version'],
             platformName: @device_descriptor['platform_name'],
             platformVersion: @device_descriptor['platform_version'],
             deviceName: @device_descriptor['device_name'],
             app: FigNewton.walle_app_path,
             name: scenario_name,
         },
     appium_lib:
         {
             server_url: sauce_server_url
         }
    }
  end

  def self.local_capabilities(scenario_name)
    {
        caps: {
            platformName: @device_descriptor['platform_name'],
            platformVersion: @device_descriptor['platform_version'],
            deviceName: @device_descriptor['device_name'],
            app: FigNewton.walle_app_path,
            name: scenario_name,
        }
    }
  end

  def self.sauce_auth_details
    "#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}"
  end

  def self.sauce_server_url
    "http://#{sauce_auth_details}@ondemand.saucelabs.com:80/wd/hub"
  end

  def self.sauce_rest_jobs_url
    "https://#{sauce_auth_details}@saucelabs.com/rest/v1/#{ENV['SAUCE_USERNAME']}/jobs"
  end

  # Because WebDriver doesn't have the concept of test failure, use the Sauce
  # Labs REST API to record job success or failure
  def self.sauce_update_job_success(appium,success)
    job_id = appium.driver.send(:bridge).session_id
    RestClient.put "#{sauce_rest_jobs_url}/#{job_id}", {'passed' => success}.to_json, :content_type => :json
  end

end
