*** Settings ***
###SETUP runs keyword before suite or test case
###TEARDOWN runs keyword after suite or test case
###We can define in setting or also in testcases. When defined in testcases, the preference to execute is the command in the block testcases


Resource         ../resource/Resource.robot
Test Setup       Open Website
#Test Teardown    Close Website


*** Test Case ***

Scenario 01: Search existent product
  Given then I'm in the website homepage
  When I search for the product "Blouse"
  Then the product "Blouse" should be listed

Scenario 02: Search inexistent product
  Given then I'm in the website homepage
  When I search for the product "Whatever"
  Then the error message "No results were found for your search "Whatever"" should be returned

Scenario 03: List products
  Given then I'm in the website homepage
  When I pass my mouse above the "Woman" category and click in sub category "Summer Dresses"
  Then a page with products from this subcategory should be shown

Scenario 04: Add product in the cart
  Given then I'm in the website homepage
  And that I search for the product "t-shirt"
  When the t-shirt pages load and I click in the button "Add to Cart"
  Then the window with text "Product successfully added to your shopping cart" should appears

Scenario 05: Remove products from cart
  Given then I'm in the website homepage
  And that I search for the product "t-shirt" and click on it
  And click in the proceed button
  And click in the cart button
  When I click in the delete product of cart button
  Then the system should show the message "Your shopping cart is empty"

Scenario 06: Add client
  Given then I'm in the website homepage
  And that I click in the "Sign in" button going top right
  And that I insert an email
  And click in the "Create an account" button
  And fill the mandatory fields
  When I click in the "Register" button to finish the registration
  Then a management page of the account should appears


*** Keywords ***

Given then I'm in the website homepage
   Access the website homepage

When I search for the product "${EXISTENT_PRODUCT}"
  Type the name of the product "${EXISTENT_PRODUCT}" in the search field
  Click on search button

Then the product "${EXISTENT_PRODUCT}" should be listed
  Check if the product "Blouse" was returned in the list

Then the error message "No results were found for your search "Whatever"" should be returned
  Check if the error message "No results were found for your search "${INEXISTENT_PRODUCT}" was returned
