When(/^Google Maps is shown$/) do
  #MAPS
  mapLayout = @appium.find_element :xpath, "//android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/android.support.v4.widget.DrawerLayout[1]/android.widget.LinearLayout[1]/android.view.View[1]/android.widget.FrameLayout[2]"
  wait = Selenium::WebDriver::Wait.new :timeout => 30, :message => "MAPS is not being displayed"
  wait.until{
    @appium.exists{mapLayout}
  }
  puts "MAPS is open"
end

Then(/^I perform (.*)$/) do |multitouch_action|
  case multitouch_action
    when "pinch"
      begin
        sleep 10
        pinch
      end
    when "zoom"
      begin
        sleep 10
        zoom
      end
  end

end
