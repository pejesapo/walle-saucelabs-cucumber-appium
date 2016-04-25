require "selenium-webdriver"
require "rspec"
require "touch_action"

describe "MobileGesturesOnWeb" do

    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @accept_next_alert = true
      @driver.manage.timeouts.implicit_wait = 30
    end

    after(:each) do
      @driver.quit
    end

    it "Swipe" do

      @driver.get "https://hammerjs.github.io/"

      title = @driver.find_element :xpath, "//h1[text()='You can touch this!']"
      wait = Selenium::WebDriver::Wait.new(:timeout => 30, :message => "No result was found")
      wait.until{
        @driver.exists{title}
      }
      puts "Title was found"

      ### SWIPE ###
      swipeElem = @driver.find_element :xpath, "//h2[text()='Swipe']/following-sibling::div"
      wait = Selenium::WebDriver::Wait.new(:timeout => 30, :message => "No result was found")
      wait.until{
        @driver.exists{swipeElem}
      }
      puts "swipeElem was found"

      element.touch_action(:flick, axis: 'x', distance: 100,  duration: 5000)
      puts "SWIPE ACTION on swipeElem"


    end

end

