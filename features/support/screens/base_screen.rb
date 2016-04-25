require 'singleton'

class BaseScreen
  include Singleton

  def set_driver(driver)
    @driver = driver
  end

  def platform
    case ENV['PLATFORM']
      when 'ios'
        IOSHelper.new(@driver)
      when 'android'
        AndroidHelper.new(@driver)
      else
        return nil
    end
  end

  def self.element(element_name, by, locator_value, index = nil)
    define_method(element_name) do
      puts "#{element_name},#{by},#{locator_value}"
      case index
        when nil
          @driver.find_element(by, locator_value)
        else
          @driver.find_elements(by, locator_value)[index]
      end
    end
  end

  def self.elements(element_name, by, locator_value)
    define_method(element_name) do
      puts "#{element_name},#{by},#{locator_value}"
      @driver.find_elements(by, locator_value)
    end
  end

end