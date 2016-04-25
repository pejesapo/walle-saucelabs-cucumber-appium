When(/^Contact App is shown$/) do

  contactListView = @appium.find_element :id, "com.example.android.contactmanager:id/contactList"
  wait = Selenium::WebDriver::Wait.new :timeout=>30, :message => "contactListView NOT found"
  wait.until{
    @appium.exists{contactListView}
  }
  puts "contactListView was found"

end

Then(/^I perform (.*) on (.*)$/) do |touch_action, contact_name|

  case touch_action
    when "tap"
      begin
        element = @appium.find_element :name, contact_name
        wait = Selenium::WebDriver::Wait.new :timeout => 30, :message => "tap - element not found #{contact_name}"
        tap_element element
      end

    when "press"
      begin
        element = @appium.find_element :name, contact_name
        wait = Selenium::WebDriver::Wait.new :timeout => 30, :message => "press - element not found #{contact_name}"
        press element
      end

    when "long_press"
      begin
        element = @appium.find_element :name, contact_name
        wait = Selenium::WebDriver::Wait.new :timeout => 30, :message => "long_press - element not found #{contact_name}"
        long_press element, 2000
      end

    when swipe_up
      begin
        swipe_up
      end

    when swipe_down
      begin
        swipe_down
      end

  end
end