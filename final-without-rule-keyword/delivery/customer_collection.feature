Feature: Customers can collect their orders

Customers can choose to collect their order from the restaurant:
- whether they are authenticated or not
- whether they pay on order or pay on collection

Rules:
-  Any visitor to the website can place a customer-collection order
-  Unauthenticated customers must supply acceptable contact details when placing an order for customer-collection
-  Customer should be informed when their order will be ready for customer-collection

Scenario: Unauthenticated customer chooses to collect order
  Given the customer is unauthenticated
  When they choose to collect their order
  Then they should be asked to supply contact details

Scenario: Authenticated customer chooses to collect order
  Given the customer is authenticated
  When they choose to collect their order
  Then they should be asked to confirm contact details

Scenario Outline: Contact details supplied ARE acceptable
  Given the customer is unauthenticated
  And they've chosen to collect their order
  When they provide <acceptable contact details>
  Then they should be asked to supply payment details

  Examples:
    | description           | acceptable contact details |
    | Name and Phone        | Name, Phone                |
    | Name and Email        | Name, Email                |
    | Everything provided   | Name, Phone, Email         |

Scenario Outline: Contact details supplied are NOT acceptable
  Given the customer is unauthenticated
  And they've chosen to collect their order
  When they provide <unacceptable contact details>
  Then they should be prevented from progressing
  And they should be informed of what made the contact details unacceptable

  Examples:
    | description | unacceptable contact details |
    | No Name     | Phone, Email                 |
    | Only Name   | Name                         |
    | Only Email  | Email                        |
    | Only Phone  | Phone                        |
    
Scenario: Estimated time of order completion is displayed
  Given the customer placed an order
    | time of order | preparation time |
    | 18:00         | 0:30             |
  When they choose to collect their order
  Then the estimated time of order completion should be displayed as 18:30
  
