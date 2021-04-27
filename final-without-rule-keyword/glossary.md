# Glossary

## Domain terms

* **Authenticated [customer]** -- Customer who has registered in the application earlier and logged in with the registered credentials (e.g. email and password).
* **Blocklist** -- List of contact details to identify unreliable customers. (Currently we store email addresses and phone numbers on the blocklist.)
* **Contact details** -- Details that allow the customer to be contacted in relation to a particular order. For authenticated customers, the contact details registered to their account are used. For unauthenticated customers the contact details must be provided with the order.
* **Customer** -- Person who visits the *Where Is My Pizza* site to order pizza and other items sold. Unauthenticated (anonymous) users are also treated as customers.
* **Customer-collection** -- A special delivery method where the customer picks up the ordered items themselves.
* **Delivery method** -- The selected method for delivering the ordered items.
* **Order** -- Food and beverage items the customer has ordered.
* **Order completion** -- Event (time) when order processing has been finished by WIMP, usually when the items have been delivered. In some cases it can be earlier (e.g. *customer-collection*).
* **Pay-on-collection** -- Payment method where the customer pays (with cash or card) when they pick up the order. This method can only be used for *customer-collection*.
* **Payment details** -- Details required to fulfil the payment. The exact details depend on the *payment method*, e.g. for card payment we need the card details, but for *pay-on-collection* there are no extra details needed.
* **Payment method** -- Selected method of payment for the order.
* **Restricted [customer]** -- Customer whose contact details are on the blocklist. They can only use a reduced set of features the site offers (e.g. they cannot use pay-on-collection). 
* **Unauthenticated [customer]** -- Customer who has not logged in.
* **Unrestricted [customer]** -- Customer that can use the full set of features of the application. 
* **Visitor** -- See *Customer*.

## Tags

* **@manual** -- The scenario is verified by manual checks and has to be excluded from automated test execution
* **@journey** -- The scenario does not illustrate a particular rule but describes a longer user journey
