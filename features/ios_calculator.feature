Feature: iOS Calculator

  Scenario Outline: Two numbers addition
    When I sum the numbers: "<x>" and "<y>"
    Then I should get "<z>" as the result

    Examples:
      | x    | y    | z    |
      | 2    | 2    | 4    |
      #| 200  | 300  | 500  |
      #| 1300 | 2400 | 3700 |


    #Scenario: Move slider
    #  When I move the slider from position "<x>" to position "<y>"