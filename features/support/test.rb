# # GETTING STARTED
# # -----------------
# # This documentation is intended to show you how to get started with a
# # simple Appium & Sauce Labs test.  This example is written with rspec and
# # appium_lib, but you can use any Selenium client and test framework you like.
# #
# # This example expects SAUCE_USERNAME and SAUCE_ACCESS_KEY to be set in your
# # environment.
# #
# # INSTALLING RVM
# # --------------
# # We're assuming you've got rvm installed, but if not, from a terminal
# # run the following line (removing the ""'s):
# #
# # "\curl -L https://get.rvm.io | bash -s stable --ruby"
# #
# # INSTALLING GEMS
# # ---------------
# # Then, change to the example directory:
# #   "cd appium-location/sample-code/examples/ruby"
# #
# # and install the required gems with bundler by doing:
# #   "bundle install"
# #
# # RUNNING TESTS
# # -------------
# # Run with:
# #
# # bundle exec rspec sauce_example.rb
# #
#
# require 'rspec'
# require 'appium_lib'
# require 'json'
# require 'rest_client'
# SAUCE_USERNAME = 'willydelacruzef'
# SAUCE_ACCESS_KEY = '53e674f7-6a0a-4f99-ad23-65b7412fe1a6'
#
# # This is the test itself
# describe 'Computation' do
#   before(:each) do
#     Appium::Driver.new(desired_caps).start_driver
#     Appium.promote_appium_methods RSpec::Core::ExampleGroup
#   end
#
#   after(:each) do
#     # Get the success by checking for assertion exceptions,
#     # and log them against the job, which is exposed by the session_id
#     #job_id = driver.send(:bridge).session_id
#     #update_job_success(job_id, example.exception.nil?)
#     driver_quit
#   end
#
#   it 'should add two numbers' do
#     sleep 5
#   end
# end
#
# def desired_caps
#   {caps:
#        {
#            'appium-version' => '1.3.7',
#            platformName: 'iOS',
#            platformVersion: '8.0',
#            deviceName: 'iPhone Simulator',
#            app: 'http://appium.s3.amazonaws.com/TestApp7.1.app.zip',
#            name: 'walle-saucelabs-cucumber-appium',
#        },
#    appium_lib:
#        {
#            server_url: 'http://willydelacruzef:53e674f7-6a0a-4f99-ad23-65b7412fe1a6@ondemand.saucelabs.com:80/wd/hub'
#        }
#   }
# end
#
# def appium_lib
#   {appium_lib:
#        {
#            server_url: 'http://willydelacruzef:53e674f7-6a0a-4f99-ad23-65b7412fe1a6@ondemand.saucelabs.com:80/wd/hub'
#        }
#   }
# end
#
# def auth_details
#   un = SAUCE_USERNAME
#   pw = SAUCE_ACCESS_KEY
#
#   unless un && pw
#     STDERR.puts <<-EOF
#       Your SAUCE_USERNAME or SAUCE_ACCESS_KEY environment variables
#       are empty or missing.
#
#       You need to set these values to your Sauce Labs username and access
#       key, respectively.
#       If you don't have a Sauce Labs account, you can get one for free at
#       http://www.saucelabs.com/signup
#     EOF
#
#     exit
#   end
#
#   return "#{un}:#{pw}"
# end
#
# def server_url
#   "http://#{auth_details}@ondemand.saucelabs.com:80/wd/hub"
# end
#
# def rest_jobs_url
#   "https://#{auth_details}@saucelabs.com/rest/v1/#{SAUCE_USERNAME}/jobs"
# end
#
# # Because WebDriver doesn't have the concept of test failure, use the Sauce
# # Labs REST API to record job success or failure
# def update_job_success(job_id, success)
#   RestClient.put "#{rest_jobs_url}/#{job_id}", {'passed' => success}.to_json, :content_type => :json
# end