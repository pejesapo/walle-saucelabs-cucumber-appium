require 'singleton'

class BaseScreen
  include Singleton

  def set_driver(driver)
    @driver = driver
  end



end