When(/^TestApp is being shown$/) do
  @gestureElem = @appium.find_element :name, "Test Gesture"
  wait = Selenium::WebDriver::Wait.new :timeout => 30, :message => "gestureElem not found"
  wait.until{
    @appium.exists{@gestureElem}
  }
end

And(/^I choose option (.*)$/) do |test_gesture_option|
  tap_element @gestureElem

  mapLayout = @appium.find_element :xpath, "//UIAApplication[1]/UIAWindow[2]/UIAMapView[1]"
  wait = Selenium::WebDriver::Wait.new :timeout => 30, :message => "MAPS is not being displayed"
  wait.until{
    @appium.exists{mapLayout}
  }
  sleep 20

end