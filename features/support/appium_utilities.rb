require 'appium_lib'

module AppiumUtilities

  def getDriverWithWebViewContext

    webview = @appium.available_contexts.last
    puts "NATIVE_VIEW: #{@appium.available_contexts.first}"
    puts "WEB_VIEW: #{webview}"
    @appium.set_context webview

  end

  def getDriverWithNativeContext

    nativeview = @appium.available_contexts.first
    puts "NATIVE_VIEW: #{nativeview}"
    @appium.set_context nativeview

  end

  # # # # # TOUCH_ACTIONS: One finger only # # # # #

  def tap_element element
    tapAction = Appium::TouchAction.new
    tapAction.tap(element: element).perform
    puts "TAP is Working \\o/"
  end

  def press(element)
    pressAction = Appium::TouchAction.new
    pressAction.press(element: element).release.perform
    puts "PRESS is Working \\o/"
  end

  def long_press(element, milisecond_duration)
    longPressAction = Appium::TouchAction.new
    longPressAction.long_press(element: element, duration: milisecond_duration).perform
    puts "LONG PRESS is Working \\o/"
  end

  def swipe_up(*args)

    # IMPORTANT: iOS 7 simulators have broken swipe.
    windowSize = @appium.driver.manage.window.size
    puts "SIZE:  #{windowSize}"

    # up_start_x = (windowSize.width/2).to_i
    # up_start_y = (windowSize.height * 0.20).to_i
    # puts "start (x,y): (#{up_start_x}, #{up_start_y})"
    #
    # up_end_x = (windowSize.width/2).to_i
    # up_end_y = (windowSize.height * 0.80).to_i
    # puts "end (x,y): (#{up_end_x}, #{up_end_y})"
    #
    # swipeUpAction = Appium::TouchAction.new
    # swipeUpAction.swipe(start_x: up_start_x, start_y: up_start_y, end_x: up_end_x, end_y: up_end_y, duration: 1000).perform
    # puts "SWIPE UP is Working \\o/\n"

    windowSize = @appium.driver.manage.window.size
    upStart_x = (windowSize.width/2).to_i
    puts "upStart_x: #{upStart_x}"

    upEnd_x = (windowSize.width/2).to_i
    puts "upEnd_x: #{upEnd_x}"

    upStart_y = (windowSize.height * 0.80).to_i
    puts "upStart_y: #{upStart_y}"

    upEnd_y = (windowSize.height * 0.20).to_i
    puts "upEnd_y: #{upEnd_y}"

    swipeUpAction = Appium::TouchAction.new
    swipeUpAction.swipe(start_x: upStart_x, start_y: upStart_y, end_x: upEnd_x, end_y: upEnd_y, duration: 2000).perform
    puts "SWIPE UP is Working \\o/"

  end

  def swipe_down(*args)

    # # IMPORTANT: iOS 7 simulators have broken swipe.
    # windowSize = @appium.driver.manage.window.size
    # down_start_x = (windowSize.width/2).to_i
    # down_start_y = (windowSize.height * 0.80).to_i
    # puts "start (x,y): (#{down_start_x}, #{down_start_y})"
    #
    # down_end_x = (windowSize.width/2).to_i
    # down_end_y = (windowSize.height * 0.20).to_i
    # puts "end (x,y): (#{down_end_x}, #{down_end_y})"
    #
    # swipeDownAction = Appium::TouchAction.new
    # swipeDownAction.swipe(start_x: down_start_x, start_y: down_start_y, end_x: down_end_x, end_y: down_end_y, duration: 1000).perform
    # puts "SWIPE DOWN is Working \\o/"

    windowSize = @appium.driver.manage.window.size
    downStart_x = (windowSize.width/2).to_i
    puts "downStart_x: #{downStart_x}"

    downEnd_x = (windowSize.width/2).to_i
    puts "downEnd_x: #{downEnd_x}"

    downStart_y = (windowSize.height * 0.20).to_i
    puts "downStart_y: #{downStart_y}"

    downEnd_y = (windowSize.height * 0.80).to_i
    puts "downEnd_y: #{downEnd_y}"

    swipeDownAction = Appium::TouchAction.new
    swipeDownAction.swipe(start_x: downStart_x, start_y: downStart_y, end_x: downEnd_x, end_y: downEnd_y, duration: 2000).perform
    puts "SWIPE DOWN is Working \\o/\n"

  end

  # # # # # MULTI_TOUCH_ACTIONS: Two fingers # # # # #
  def pinch

    windowSize = @appium.driver.manage.window.size
    puts "SIZE:  #{windowSize}"

    upStart_x = (windowSize.width/2).to_i
    upStart_y = (windowSize.height * 0.80).to_i

    puts "SWIPE BOTTOM TO TOP - ORIGIN: #{upStart_x}, #{upStart_y}"

    upEnd_x = (windowSize.width/2).to_i
    upEnd_y = (windowSize.height * 0.20).to_i

    puts "SWIPE BOTTOM TO TOP - DESTINY : #{upEnd_x}, #{upEnd_y}"
    pinchSwipeUpAction = Appium::TouchAction.new
    pinchSwipeUpAction.swipe(start_x: upStart_x, start_y: upStart_y, end_x: upEnd_x, end_y: upEnd_y, duration: 1)

    downStart_x = (windowSize.width/2).to_i
    downStart_y = (windowSize.height * 0.20).to_i
    puts "SWIPE TOP TO BOTTOM - ORIGIN: #{downStart_x}, #{downStart_y}"

    downEnd_x = (windowSize.width/2).to_i
    downEnd_y = (windowSize.height * 0.80).to_i
    puts "SWIPE TOP TO BOTTOM - DESTINY: #{downEnd_x}, #{downEnd_y}"

    pinchSwipeDownAction = Appium::TouchAction.new
    pinchSwipeDownAction.swipe(start_x: downStart_x, start_y: downStart_y, end_x: downEnd_x, end_y: downEnd_y, duration: 1)

    zoomMultiTouchAction = Appium::MultiTouch.new
    zoomMultiTouchAction.add pinchSwipeDownAction
    zoomMultiTouchAction.add pinchSwipeUpAction
    zoomMultiTouchAction.perform

  end

  # def zoom
  #   fail "Not implemented"
  # end

  # # # # # NOT IMPLEMENTED - SECONDARY ACTIONS # # # # #

  # def scroll_until_end
  #   fail "Not implemented"
  # end
  #
  # def scroll_to element
  #   fail "Not implemented"
  # end
  #
  # def slide_up
  #   fail "Not implemented"
  # end
  #
  # def slide_down
  #   fail "Not implemented"
  # end
  #
  # def accept_permissions
  #   fail "Not implemented"
  # end
  #
  # def reject_permissions
  #   fail "Not implemented"
  # end

end

World(AppiumUtilities)