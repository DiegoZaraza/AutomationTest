Feature: Search product Ebay

Scenario: Search product ebay
 Given Enter Ebay index page
  When Enter 'SHOES' for search object
   And Check for brand 'PUMA'
   And Check for size '10'
   And Get search result quantity
   And Order by 'Precio + Envío: más bajo primero'
   And Get the first 5 search results
  Then Print the search results
   And Print the search results by name
   And Print the search results by price
