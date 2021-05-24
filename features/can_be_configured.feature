Feature: Can be configured
  This is a high quality product and it has some advanced confiugration
  options to give the user some control of the coffee it produces.

  Scenario: Display settings
    Given the coffee machine is started
    When I switch to settings mode
    Then displayed message is:
      """
      Settings:
       - 1: water hardness
       - 2: grinder
      """

  Scenario: Default settings
    Given the coffee machine is started
    When I switch to settings mode
    Then settings should be:
      | water hardness | 2      |
      | grinder        | medium |
