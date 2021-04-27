Feature: Customers can choose to pay on collection

Rules:
-  Customers can choose for customer-collection orders to be pay-on-collection
-  Don't offer pay-on-collection for restricted customers

Scenario: Customer chooses to pay on collection
  Given the customer has chosen to collect their order
  When they choose to pay on collection
  Then they should be provided with an order confirmation

# Two scenarios merged, because authentication is incidental
Scenario: Restricted customer is not offered pay-on-collection option
  Given a restricted customer
  When they place an order for customer-collection
  Then pay-on-collection should not be offered as a payment option
