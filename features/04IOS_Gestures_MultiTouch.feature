Feature: Testing touch actions on iOS Native App

  Scenario Outline: Multitouch actions on iOS Native App
    When TestApp7.1 is being shown
    And I choose option <test_gesture_option>
    Then I perform <touch_action>
    Examples:
      | test_gesture_option | touch_action    |
      | Test Gesture        | pinch           |
      #| Test Gesture        | zoom            |