class CalculatorScreen < BaseScreen

  # Screen UI elements
    element(:field_one, :accessibility_id, "TextField1")
    element(:field_two, :class_name, "UIATextField",1)
    element(:sum_button, :accessibility_id, "ComputeSumButton")
    element(:sum_field, :class_name, "UIAStaticText",0)

  # Screen Services
  def enter_first_value(value)
    # @field_one = @driver.find_element :accessibility_id, "TextField1"
    # @field_one.send_keys value.to_i
    field_one.send_keys value.to_i
    @x = value
  end

  def enter_second_value(value)
    # @field_two = @driver.find_elements(:class_name, "UIATextField")[1]
    # @field_two.send_keys value.to_i
    field_two.send_keys value.to_i
    @y = value
  end

  def sum
    # @driver.find_element(:accessibility_id, "ComputeSumButton").click
    sum_button.click
  end

  def get_sum_value
    # @driver.find_elements(:class_name, "UIAStaticText")[0].text
    sum_field.text
  end

  def print
    puts "#{@x},#{@y}"
  end

  def open_camera(args)
    platform.open_camera(args)
  end

  def enable_mic(args)
    platform.enable_mic(args)
  end
end