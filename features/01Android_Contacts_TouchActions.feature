Feature: Testing TouchActions

  Scenario Outline: Touch actions on Android Native App
    When Contact App is shown
    Then I perform <touch_action> on <contact_name>
    Examples:
      | touch_action    | contact_name         |
      | tap             | Agatha Torres Rojas  |
      | press           | Appium User          |
      | long_press      | Andrés Escobar       |
      | swipe_up        | Anybody              |
      | swipe_down      | Anybody              |





