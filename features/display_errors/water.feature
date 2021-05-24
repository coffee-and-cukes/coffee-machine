Feature: Water
  To maintain an uninterrupted supply of coffee it is important to keep
  the water tank filled with fresh water.

  Background:
    Given the coffee machine is started
    And I handle everything except the water tank

  Scenario: Message "Fill water tank" is displayed after 50 coffees are taken
    When I take "50" coffees
    Then message "Fill tank" should be displayed

  Scenario: It is possible to take 10 coffees after the message "Fill water tank" is displayed
    Given I take "60" coffees
    Then coffee should be served
    When I take a coffee
    Then coffee should not be served

  Scenario: When the water tank is filled, the message disappears
    Given I take "55" coffees
    When I fill the water tank
    Then message "Ready" should be displayed
