Feature: Customers can collect their orders

Scenario: Customer chooses to pay on collection
  Given the customer has chosen to collect their order
  When they proceed to payment instructions
  Then they should be able to choose to pay on collection
