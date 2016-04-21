class CalculatorScreen < BaseScreen

  # Screen UI elements

  #element(:ios, :sum_button, :class_name => 'myCSSClass')
  #element(:android, :sum_button, :id => 'myID')


  # Screen Services
  def enter_first_value(value)
    @field_one = @driver.find_element :accessibility_id, "TextField1"
    @field_one.send_keys value.to_i
    @x = value
  end

  def enter_second_value(value)
    @field_two = @driver.find_elements(:class_name, "UIATextField")[1]
    @field_two.send_keys value.to_i
    @y = value
  end

  def sum
    @driver.find_element(:accessibility_id, "ComputeSumButton").click
  end

  def get_sum_value
    @driver.find_elements(:class_name, "UIAStaticText")[0].text
  end

  def print
    puts "#{@x},#{@y}"
  end
end