require "selenium-webdriver"
require "rspec"
require 'yaml'
require 'appium_lib'

describe "MobileGesturesOnWeb" do

  before(:each) do

    capabilities =
        {
            caps: {
                platformName: 'Android',
                platformVersion: '4.4',
                deviceName: 'Android Emulator',
                app: '/Users/stephanydaneri/Documents/workspace/poc_aws_basictest/src/test/resources/apps/ContactManager.apk',
                name: 'MobileGesturesOnWeb',
            },
            appium_lib:
                {
                    server_url: 'http://127.0.0.1:4723/wd/hub'
                }
        }

    @appium = Appium::Driver.new(capabilities)
    Appium.promote_appium_methods RSpec::Core::ExampleGroup
    @appium.start_driver
  end

  after(:each) do
    @appium.driver_quit
  end

  it "Touch Actions" do

    contactListView = @appium.find_element :id, "com.example.android.contactmanager:id/contactList"
    wait = Selenium::WebDriver::Wait.new :timeout=>30, :message => "contactListView NOT found"
    wait.until{
      @appium.exists{contactListView}
    }
    puts "contactListView was found =)!"

    windowSize = @appium.driver.manage.window.size
    puts "SIZE:  #{windowSize}"
    # appiumDriver.context("NATIVE_APP"); <=== REVIEW FOR HYBRID, MAYBE THIS IS IMPORTANT FOR THAT CASE


    ### TOUCH ACTIONS ###

    # #PRESS (stays pressed until you say 'release')
    # contactName = @appium.find_element(:name, "Agatha Torres Rojas")
    # pressAction = Appium::TouchAction.new
    # pressAction.press(element: contactName).release.perform
    # puts "PRESS is Working \\o/"
    # # - - - - - - - - - - - - - - - - - - - - -
    #
    # # #LONG PRESS (stays pressed for specific duration)
    # contactName2 = @appium.find_element(:name, "Appium User")
    # longPressAction = Appium::TouchAction.new
    # longPressAction.long_press(element: contactName2, duration: 4000).perform
    # puts "LONG PRESS is Working \\o/"
    # # - - - - - - - - - - - - - - - - - - - - -
    #
    # # #TAP
    # contactName3 = @appium.find_element(:name, "Ana Bell")
    # tapAction = Appium::TouchAction.new
    # tapAction.tap(element: contactName3).perform
    # puts "TAP is Working \\o/"
    # - - - - - - - - - - - - - - - - - - - - -

    ##### <<<<<<< SWIPE >>>>>>> #####
    # IMPORTANT: iOS 7 simulators have broken swipe.
    # :start_x (int) — Where to start swiping, on the x axis. Default 0.
    # :start_y (int) — Where to start swiping, on the y axis. Default 0.
    # :end_x (int) — Where to end swiping, on the x axis. Default 0.
    # :end_y (int) — Where to end swiping, on the y axis. Default 0.
    # :duration (int) — How long the actual swipe takes to complete in milliseconds. Default 200.


    # - - > SWIPE UP [Bottom to Top] < - -
    upStart_x = (windowSize.width/2).to_i
    puts "upStart_x: #{upStart_x}"

    upEnd_x = (windowSize.width/2).to_i
    puts "upEnd_x: #{upEnd_x}"

    upStart_y = (windowSize.height * 0.80).to_i
    puts "upStart_y: #{upStart_y}"

    upEnd_y = (windowSize.height * 0.20).to_i
    puts "upEnd_y: #{upEnd_y}"

    swipeUpAction = Appium::TouchAction.new
    swipeUpAction.swipe(start_x: upStart_x, start_y: upStart_y, end_x: upEnd_x, end_y: upEnd_y, duration: 2000).perform
    puts "SWIPE UP is Working \\o/"
    # - - - - - - - - - - - - - - - - - - - - -


    # - - > SWIPE DOWN [Top to Bottom] < - - #
    downStart_x = (windowSize.width/2).to_i
    puts "downStart_x: #{downStart_x}"

    downEnd_x = (windowSize.width/2).to_i
    puts "downEnd_x: #{downEnd_x}"

    downStart_y = (windowSize.height * 0.20).to_i
    puts "downStart_y: #{downStart_y}"

    downEnd_y = (windowSize.height * 0.80).to_i
    puts "downEnd_y: #{downEnd_y}"

    swipeDownAction = Appium::TouchAction.new
    swipeDownAction.swipe(start_x: downStart_x, start_y: downStart_y, end_x: downEnd_x, end_y: downEnd_y, duration: 2000).perform
    puts "SWIPE DOWN is Working \\o/\n"
    # - - - - - - - - - - - - - - - - - - - - -


    #OUT OF SCOPE
    # - - > SWIPE UNTIL END OF SCREEN < - - (DOESN'T WORK)
    #@appium.execute_script 'mobile: scroll', direction: 'down'

    #move_to



  end

end