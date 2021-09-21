Feature: Serve coffee
  This simple coffee machine will serve a single espresso or a cappuccino
    
  Rule: Choose betwee espresso and cappuccino
    @CM-10
    Scenario: Serve espresso
      Given the coffee machine is ready to serve coffee
      When I take an espresso
      Then espresso should be served

    @CM-10
    Scenario: Serve cappuccino
      Given the coffee machine is ready to serve coffee
      When I take a cappuccino
      Then cappuccino should be served

  Rule: No warning if milk level is low
    @CM-10
    Scenario: No milk
      Given the coffee machine is ready to serve coffee
      But there is no milk
      When I take a cappuccino
      Then espresso should be served