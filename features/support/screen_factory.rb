module ScreenFactory
  def on(screen)
    screen_object_instance = eval("#{screen.to_s}.instance")
    screen_object_instance.set_driver(@appium)
    screen_object_instance
  end

end

World(ScreenFactory)