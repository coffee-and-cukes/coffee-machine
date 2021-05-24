Feature: Serve coffee
  This simple coffee machine will only serve a single espresso

  @split[serve_cappuccino:off]
  Scenario: Simple use
    # Well, sometimes, you just get a coffee.
    Given the coffee machine is started
    When I take a coffee
    Then coffee should be served
    
  @split[serve_cappuccino:on]
  Scenario: Serve espresso
    Given the coffee machine is started
    When I take an espresso
    Then espresso should be served
    
  @split[serve_cappuccino:on]
  Scenario: Serve cappuccino
    Given the coffee machine is started
    When I take a cappuccino
    Then cappucino should be served
