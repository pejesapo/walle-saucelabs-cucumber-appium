Feature: Testing touch actions on Hybrid

  Scenario Outline: Touch actions on Hybrid Ionic Products app
    When Products app is being shown
    Then on the hybrid app I perform <touch_action> on <product_name>
    Examples:
      | touch_action    | product_name         |
      | tap             | app.lo               |
      | swipe_up        | Anybody              |
      #| swipe_down      | Anybody              |