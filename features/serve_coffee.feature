Feature: Serve coffee

  This simple coffee machine will only serve a single espresso

  Scenario: Simple use
    # Well, sometimes, you just get a coffee.
    Given the coffee machine is started
    When I take a coffee
    Then coffee should be served
