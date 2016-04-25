class CalculatorScreen < BaseScreen

  # Screen UI elements
    element(:field_one, :accessibility_id, "TextField1")
    elements(:field_two, :class_name, "UIATextField")
    element(:sum_button, :accessibility_id, "ComputeSumButton")
    elements(:sum_field, :class_name, "UIAStaticText")

  # Screen Services
  def enter_first_value(value)
    field_one.send_keys value.to_i
    @x = value
  end

  def enter_second_value(value)
    field_two[1].send_keys value.to_i
    @y = value
  end

  def sum
    sum_button.click
  end

  def get_sum_value
    sum_field[0].text
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