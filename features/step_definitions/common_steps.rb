Given(/^the app is launched$/) do
  case ENV['TYPE']
    when 'hybrid'
      @driver.available_contexts # ['NATIVE_APP', 'WEBVIEW_1']
      @driver.set_context "WEBVIEW_1"
      @driver.current_context.should eq('WEBVIEW_1')


      @webdriver = @driver.driver
      @webdriver.navigate.to "http://www.google.com"
      sleep 5
      search = @webdriver.find_element :name, "q"
      search.send_keys "sauce labs"
      search.send_keys :enter

      # allow the page to load
      wait = Selenium::WebDriver::Wait.new(:timeout => 10, :message => "Unable to find 'saucelabs' as the browser window title")
      wait.until { "saucelabs" == (@webdriver.title[0..9]) }

      @driver.switch_to_default_context

    when 'native'
      field_one = @driver.find_element :accessibility_id, "TextField1"
      field_one.send_keys 12

      field_two = @driver.find_elements(:class_name, "UIATextField")[1]
      field_two.send_keys 8

      # they should be the same size, and the first should be above the second
      field_one.location.y.should be < field_two.location.y
      field_one.size.should eq(field_two.size)

      # trigger computation by using the button
      @driver.find_element(:accessibility_id, "ComputeSumButton").click

      # is sum equal?
      sum = @driver.find_elements(:class_name, "UIAStaticText")[0].text
      sum.to_i.should eq(20)
  end

  sleep 10
end