require 'touch_action'

Given(/^I am starting this tests$/) do
  puts "STARTING TEST EXECUTION"
end

When(/^I search for (.*)$/) do |site|

  #Find one element to be sure Im on the right screen
  enterUrlInput = @appium.find_element(:xpath, "//UIAApplication[1]/UIAWindow[2]/UIATextField[1]")

  wait = Selenium::WebDriver::Wait.new(:timeout => 30, :message => "Unable to find elements on Native Context")
  wait.until {
    @appium.exists{enterUrlInput}
  }

  urlinputValue1 = enterUrlInput.value
  puts "urlinputValue1 > #{urlinputValue1}"

  #Find url input and enter site name
  enterUrlInput = @appium.find_element :xpath, "//UIAApplication[1]/UIAWindow[2]/UIATextField[1]"
  enterUrlInput.click
  enterUrlInput.send_keys site

  urlinputValue2 = enterUrlInput.value
  puts "urlinputValue2 > #{urlinputValue2}"

  #Click on 'Go'
  #goBtn = @appium.find_element :xpath , "//UIAApplication[1]/UIAWindow[2]/UIAButton[1]"
  goBtn = @appium.find_element :name, "Go"
  goBtn.click
  puts "Clicking 'Go'"

  sleep 5

end

Then(/^I should see a (.*) on the page$/) do |characteristicText|

  #Find characteristic text on search result

  getDriverWithWebViewContext

  sleep 5

  ### Begin - Searching by Google

    # puts "@appium.current_context >> #{@appium.current_context}"
    # search = @appium.find_element :name, "q"                 # WORKS
    # wait = Selenium::WebDriver::Wait.new(:timeout => 30, :message => "Unable to find elements on WebView")
    # wait.until {
    #   @appium.exists{search}
    # }
    #
    # search.send_keys "Appium"
    # search.send_keys :enter
    # sleep 10

  ### End - Searching by Google

  # # - - - # - - - Begin - Switch Native to Web

    # getDriverWithNativeContext
    # enterUrlInput = @appium.find_element(:xpath, "//UIAApplication[1]/UIAWindow[2]/UIATextField[1]")
    # wait = Selenium::WebDriver::Wait.new(:timeout => 30, :message => "Unable to find elements for search home screen")
    # wait.until {
    #   @appium.exists{enterUrlInput}
    # }
    #
    # urlinputValue1 = enterUrlInput.value
    # puts "urlinputValue1 > #{urlinputValue1}"
    #
    # enterUrlInput = @appium.find_element :xpath, "//UIAApplication[1]/UIAWindow[2]/UIATextField[1]"
    # enterUrlInput.click
    # enterUrlInput.clear
    # enterUrlInput.send_keys "www.google.com.uk"
    # urlinputValue2 = enterUrlInput.value
    # puts "urlinputValue2 > #{urlinputValue2}"
    #
    # goBtn = @appium.find_element :xpath , "//UIAApplication[1]/UIAWindow[2]/UIAButton[1]"
    # goBtn = @appium.find_element :name, "Go"
    # goBtn.click
    # puts "Clicking 'Go'"
    #
    # getDriverWithWebViewContext
    #
    # search = @appium.find_element :name, "q"                 # WORKS
    # wait2 = Selenium::WebDriver::Wait.new(:timeout => 30, :message => "Unable to find elements on WebView")
    # wait2.until {
    #   @appium.exists{search}
    # }
    #
    # #
    # # #search = @appium.driver.find_element :name, "Buscar"     # DOESN'T WORK
    # # #search = @appium.find_element :xpath, "/UIAApplication[1]/UIAWindow[2]/UIAScrollView[1]/UIAWebView[1]/UIAElement[1]"
    # #
    # #
    # search.click
    # search.clear
    # search.send_keys "Appium have tons of things to research"
    # search.send_keys :enter
    # sleep 5


  # wait = Selenium::WebDriver::Wait.new(:timeout => 30, :message => "Unable to find elements for search result screen")
  # wait.until {
  #   @appium.exists{search}
  # }
  #

  # # - - - # - - - End - Switch Native to Web

  @appium.scroll_to_exact "/ Zoom"

  ### SWIPE ###
  swipeElem = @appium.find_element :xpath, "//h2[text()='Swipe']/following-sibling::div"
  wait = Selenium::WebDriver::Wait.new(:timeout => 30, :message => "No result was found")
  wait.until{
    @appium.exists{swipeElem}
  }
  puts "swipeElem was found"

  element.touch_action(:flick, axis: 'x', distance: 100,  duration: 5000)
  puts "SWIPE ACTION on swipeElem"

  ### TAP ###
  tapElem = @appium.find_element :xpath, "//h2[text()='Tap']/following-sibling::div"
  tapElem.touch_action(:tap)
  #content.touch_action(:doubletap)
  puts "tapElem - TAP"
  sleep 5

  ### PINCH ###
  pinchElem = @appium.find_element :xpath, "//h2[text()='Pinch / Zoom']/following-sibling::div"
  pinchElem.touch_action(:pinch, r1: 50, r2: 100)
  puts "pinchElem - PINCH"
  sleep 5

  ### ROTATE ###
  rotateElem = @appium.find_element :xpath, "//h2[text()='Rotate']/following-sibling::div"
  rotateElem.touch_action(:rotate, {rotation: -75})
  puts "rotateElem - ROTATE"
  sleep 5

  ### PRESS ###
  pressElem = @appium.find_element :xpath, "//h2[text()='Press']/following-sibling::div"
  pressElem.touch_action(:press,  hold: 2000)
  puts "pressElem - PRESS"
  sleep 5
  #element.touch_action(:move, xdist: 70, ydist: -50,  duration: 500)

  sleep 10

end

