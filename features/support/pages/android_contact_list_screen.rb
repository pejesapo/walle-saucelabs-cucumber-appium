class AndroidContactListScreen < BaseScreen

  def contactListIsBeingShown
    @contactListView = @appium.find_element :id, "com.example.android.contactmanager:id/contactList"
    wait = Selenium::WebDriver::Wait.new :timeout=>30, :message => "contactListView NOT found"
    wait.until{
      @appium.exists{contactListView}
    }
    puts "contactListView was found"
  end

end