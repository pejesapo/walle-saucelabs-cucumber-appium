When(/^I attempt to create a new note with text: "([^"]*)"$/) do |text|
  @appium.find('New note').click
  @appium.first_textfield.type(text)
end

And(/^I save it$/) do
  @appium.find('Save').click
end

Then(/^I should have a new note with text: "([^"]*)"$/) do |text|
  note_count = @appium.ids('android:id/text1').length
  note_count.should == 1
  @appium.texts.last.text.should eq(text)
end