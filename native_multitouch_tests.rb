require "selenium-webdriver"
require "rspec"
require 'yaml'
require 'appium_lib'

describe "MultiTouch" do

  before(:each) do

    capabilities =
        {
            caps: {
                platformName: 'Android',
                platformVersion: '4.4',
                deviceName: 'Android Emulator',
                name: 'MultiTouchOnWeb',
                app: '',

                #CAMERA
                # appPackage: 'com.sec.android.app.camera',
                # appActivity: 'com.sec.android.app.camera.Camera'

                #GOOGLE MAPS
                appPackage: 'com.google.android.apps.maps',
                appActivity: 'com.google.android.maps.MapsActivity'

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

  it "MultiTouch Gestures" do

    # ### MULTI TOUCH ACTIONS ###

    # CAMERA
    # cameraLayout = @appium.find_element :id, "empty_layout"
    # wait = Selenium::WebDriver::Wait.new :timeout => 30, :message => "Camera is not being displayed"
    # wait.until{
    #   @appium.exists{cameraLayout}
    # }
    # puts "Camera is open"

    #MAPS
    mapLayout = @appium.find_element :xpath, "//android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.support.v4.widget.DrawerLayout[1]/android.widget.LinearLayout[1]/android.view.View[1]/android.widget.FrameLayout[2]"
    #                                        "//android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.support.v4.widget.DrawerLayout[1]/android.widget.LinearLayout[1]/android.view.View[1]/android.widget.FrameLayout[2]"
    wait = Selenium::WebDriver::Wait.new :timeout => 30, :message => "MAPS is not being displayed"
    wait.until{
      @appium.exists{mapLayout}
    }
    puts "MAPS is open"


    # pressAction = Appium::TouchAction.new
    # pressAction.press(element: mapLayout).release.perform
    # puts "Press action performed"

    # zoomAction = Appium::MultiTouch.initialize
    # @appium.zoom(percentage = 200, auto_perform = true)
    # puts "ZOOM action performed"

    # pinchAction = Appium::MultiTouch.new
    # @appium.pinch(percentage = 25, auto_perform = true)
    # puts "Pinch MultiTouch Action perform"

    # windowSize = @appium.driver.manage.window.size
    # puts "SIZE:  #{windowSize}"
    #
    # upStart_x = (windowSize.width/2).to_i
    # upStart_y = (windowSize.height * 0.80).to_i
    #
    # puts "SWIPE BOTTOM TO TOP - ORIGIN: #{upStart_x}, #{upStart_y}"
    #
    # upEnd_x = (windowSize.width/2).to_i
    # upEnd_y = (windowSize.height * 0.20).to_i
    #
    # puts "SWIPE BOTTOM TO TOP - DESTINY : #{upEnd_x}, #{upEnd_y}"
    # pinchSwipeUpAction = Appium::TouchAction.new
    # pinchSwipeUpAction.swipe(start_x: upStart_x, start_y: upStart_y, end_x: upEnd_x, end_y: upEnd_y, duration: 1)
    #
    # downStart_x = (windowSize.width/2).to_i
    # downStart_y = (windowSize.height * 0.20).to_i
    # puts "SWIPE TOP TO BOTTOM - ORIGIN: #{downStart_x}, #{downStart_y}"
    #
    # downEnd_x = (windowSize.width/2).to_i
    # downEnd_y = (windowSize.height * 0.80).to_i
    # puts "SWIPE TOP TO BOTTOM - DESTINY: #{downEnd_x}, #{downEnd_y}"
    #
    # pinchSwipeDownAction = Appium::TouchAction.new
    # pinchSwipeDownAction.swipe(start_x: downStart_x, start_y: downStart_y, end_x: downEnd_x, end_y: downEnd_y, duration: 1)
    #
    #
    # # zoomMultiTouchAction = Appium::MultiTouch.new
    # # zoomMultiTouchAction.add pinchSwipeDownAction
    # # zoomMultiTouchAction.add pinchSwipeUpAction
    # # zoomMultiTouchAction.perform
    #
    # #PINCH - - -
    # pinchMultiTouchAction = Appium::MultiTouch.new
    # pinchMultiTouchAction.add pinchSwipeUpAction
    # pinchMultiTouchAction.add pinchSwipeDownAction
    # pinchMultiTouchAction.perform
    #
    # puts "PINCH PERFORM \\O/, jajaja I beat you ¬.¬"


    windowSize = @appium.driver.manage.window.size

    zoomSwipeUpAction = Appium::TouchAction.new
    #zoomSwipeUpAction.swipe(start_x: 540, start_y: 1200, end_x: 540, end_y: 400, duration: 1)
    zoomSwipeUpAction.swipe(start_x: 0.3, start_y: 0.3, end_x: 1, end_y: 1, duration: 1)


    zoomSwipeDownAction = Appium::TouchAction.new
    #zoomSwipeDownAction.swipe(start_x: 540, start_y: 1200, end_x: 540, end_y: 1800, duration: 1)
    zoomSwipeDownAction.swipe(start_x: 0.4, start_y: 0.4, end_x: 1, end_y: 1, duration: 1)


    zoomMultiTouchAction = Appium::MultiTouch.new
    zoomMultiTouchAction.add zoomSwipeDownAction
    zoomMultiTouchAction.add zoomSwipeUpAction

    zoomMultiTouchAction.perform

    puts "ZOOM PERFORMED"

    #test = Appium::MultiTouch.new
    #@appium.zoom(percentage = 200, auto_perform = true)



  end

end