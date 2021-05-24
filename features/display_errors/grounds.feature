Feature: Grounds
  To maintain a clean machine it is important to regularly empty the 
  coffee grounds.

  Background:
    Given the coffee machine is started
    And I handle everything except the grounds

  Scenario: Message "Empty grounds" is displayed after 30 coffees are taken
    When I take "30" coffees
    Then message "Empty grounds" should be displayed

  Scenario: When the grounds are emptied, message is removed
    Given I take "30" coffees
    When I empty the coffee grounds
    Then message "Ready" should be displayed
