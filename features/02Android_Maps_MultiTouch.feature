Feature: Testing MultiTouchActions

  Scenario Outline: MultiTouch actions on Google Maps
    When Google Maps is shown
    Then I perform <multitouch_action>
    Examples:
      | multitouch_action |
      | pinch             |
      #| zoom              |
