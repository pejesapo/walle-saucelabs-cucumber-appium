require 'appium_lib'
require 'rest_client'

module AppiumConfig

  def sauce_capabilities(scenario_name)
    {caps:
         {
             'appium-version' => FigNewton.appium_version,
             platformName: FigNewton.platform_name,
             platformVersion: FigNewton.platform_version,
             deviceName: FigNewton.device_name,
             app: FigNewton.app_path,
             name: scenario_name,
         },
     appium_lib:
         {
             server_url: sauce_server_url
         }
    }
  end

  def local_capabilities(scenario_name)
    {
        caps: {
            platformName: FigNewton.platform_name,
            platformVersion: FigNewton.platform_version,
            deviceName: FigNewton.device_name,
            app: FigNewton.app_path,
            name: scenario_name,
        }
    }
  end

  def sauce_auth_details
    "#{FigNewton.sauce_username}:#{FigNewton.sauce_access_key}"
  end

  def sauce_server_url
    "http://#{sauce_auth_details}@ondemand.saucelabs.com:80/wd/hub"
  end

  def sauce_rest_jobs_url
    "https://#{sauce_auth_details}@saucelabs.com/rest/v1/#{FigNewton.sauce_username}/jobs"
  end

  # Because WebDriver doesn't have the concept of test failure, use the Sauce
  # Labs REST API to record job success or failure
  def sauce_update_job_success(success)
    job_id = @appium.driver.send(:bridge).session_id
    RestClient.put "#{sauce_rest_jobs_url}/#{job_id}", {'passed' => success}.to_json, :content_type => :json
  end

end
