Feature: Blocklisting

Rules:
-  Don't offer pay-on-collection for restricted customers
-  Customer's email OR phone must match those on blocklist
-  Restrictions are independent of authentication status
-  Blocklist is manually configurable

# Two scenarios merged, because authentication is incidental
Scenario: Restricted customer is not offered pay-on-collection option
  Given a restricted customer
  When they place an order for customer-collection
  Then pay-on-collection should not be offered as a payment option

Scenario Outline: Decide if customer is restricted
  Given the customer's contact details are on the blocklist: 
    | email          | phone number   |
    | <email listed> | <phone listed> |
  When the blocklist is checked
  Then the customer should be treated as <status>

  Examples:
    | description    | email listed | phone listed | status       |
    | Both listed    | yes          | yes          | restricted   |
    | Email listed   | yes          | no           | restricted   |
    | Phone listed   | no           | yes          | restricted   |
    | Neither listed | no           | no           | unrestricted |

Scenario: Unauthenticated customer is restricted
  Given a customer is unauthenticated
  And the order's contact details are on the blocklist: 
    | email | phone number |
    | yes   | yes          |
  When the blocklist is checked
  Then they should be treated as restricted

Scenario: Authenticated customer is restricted
  Given a customer is authenticated
  And the account's contact details are on the blocklist: 
    | email | phone number |
    | yes   | yes          |
  When the blocklist is checked
  Then they should be treated as restricted

@manual
Scenario: Upload replacement blocklist
  Given a blocklist is defined using email and phone numbers
  When the blocklist is uploaded
  Then the upload should replace the existing blocklist
