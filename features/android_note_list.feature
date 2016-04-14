Feature: Note list

  Scenario Outline: Create a new note
    When I attempt to create a new note with text: "<text>"
    And I save it
    Then I should have a new note with text: "<text>"
    Examples:
      | text                                                                                  |
      | This is a new note                                                                    |
      | This is very long long long long long long long long long long long long and new note |
