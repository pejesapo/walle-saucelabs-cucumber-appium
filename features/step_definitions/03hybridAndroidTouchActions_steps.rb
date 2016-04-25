When(/^Products app is being shown$/) do
  webview = @appium.find_element :xpath, "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]"
  wait = Selenium::WebDriver::Wait.new(:timeout => 30, :message => "Unable to find elements on Native Context")
  wait.until {
    @appium.exists{webview}
  }
end

Then(/^on the hybrid app I perform (.*) on (.*)$/) do |touch_action, product_name|
  case touch_action
    when "tap"
      #getDriverWithWebViewContext
      sleep 5
      product = @appium.find_element :xpath, "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.webkit.WebView[1]/android.view.View[3]"
      #"//*[text()='#{product_name}']"
      tap_element product


    when "swipe_up"
      begin
        sleep 5
        swipe_up
      end
  end
end