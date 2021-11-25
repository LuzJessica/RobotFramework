*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${BROWSER}                       chrome
${URL}                           http://automationpractice.com
${EXISTENT_PRODUCT}              Blouse
${INEXISTENT_PRODUCT}            Whatever
${SUB_CATEGORY}                  Summer Dresses
${PRODUCT_TO_ADD_IN_CAR}         t-shirt
${PRODUCT_ADDED_TO_CAR_MESSAGE}  Product successfully added to your shopping cart
${EMPTY_CART_MESSAGE}            Your shopping cart is empty.
${EMAIL}                         atttwwww2tcv33x@gmail.br
${FIRST_NAME}                    Alex
${LAST_NAME}                     Luz
${PASSWORD}                      123456
${ADDRESS}                        Rua Chucri Zogbi
${CITY}                          Americana
${STATE}                         SP
${ZIPCODE}                       12345
${MOBILE_PHONE}                  99735-1423

*** Keywords ***
#### SETUP AND TEARDOWN ####
Open Website
  Open browser  about:blank  chrome

Close Website
  Close browser

#### STEP BY STEP ####
Access the website homepage
  Go To   http://automationpractice.com
  Title Should Be   My Store

Type the name of the product "${EXISTENT_PRODUCT}" in the search field
  Input Text  id=search_query_top  ${EXISTENT_PRODUCT}

Click on search button
  Click Element    name=submit_search

Check if the product "Blouse" was returned in the list
  Wait Until Element Is Visible   css=h1.product-listing
  Title Should Be    Search - My Store
  Element Text Should Be    xpath=//div/h5/a[@title='Blouse']    ${EXISTENT_PRODUCT}

Check if the error message "No results were found for your search "${INEXISTENT_PRODUCT}" was returned
  Element Text Should Be    css=p.alert.alert-warning    No results were found for your search "${INEXISTENT_PRODUCT}"

When I pass my mouse above the "${CATEGORY}" category and click in sub category "${SUB_CATEGORY}"
  Mouse Over    xpath=//ul/li/a[@title='Women']
  Click Link    xpath=/html[1]/body[1]/div[1]/div[1]/header[1]/div[3]/div[1]/div[1]/div[6]/ul[1]/li[1]/ul[1]/li[2]/ul[1]/li[3]/a[1]

Then a page with products from this subcategory should be shown
  Title Should Be    Summer Dresses - My Store

And that I search for the product "${PRODUCT_TO_ADD_IN_CAR}"
  Input Text  id=search_query_top  ${PRODUCT_TO_ADD_IN_CAR}
  Click Element    name=submit_search

When the t-shirt pages load and I click in the button "Add to Cart"
  Wait Until Element Is Enabled    css=h1.product-listing
  Element Text Should Be    //div/h1/span[@class='lighter']    "T-SHIRT"
  Click Element    xpath=/html[1]/body[1]/div[1]/div[2]/div[1]/div[3]/div[2]/ul[1]/li[1]/div[1]/div[2]/div[2]/a[1]/span[1]

Then the window with text "Product successfully added to your shopping cart" should appears
  Wait Until Element Is Visible    css=div.layer_cart_product.col-xs-12.col-md-6
  Element Text Should Be    xpath=/html[1]/body[1]/div[1]/div[1]/header[1]/div[3]/div[1]/div[1]/div[4]/div[1]/div[1]/h2[1]    ${PRODUCT_ADDED_TO_CAR_MESSAGE}

And that I search for the product "${PRODUCT_TO_ADD_IN_CAR}" and click on it
  Input Text  id=search_query_top  ${PRODUCT_TO_ADD_IN_CAR}
  Click Element    name=submit_search
  Wait Until Element Is Enabled    css=h1.product-listing
  Click Element    xpath=/html[1]/body[1]/div[1]/div[2]/div[1]/div[3]/div[2]/ul[1]/li[1]/div[1]/div[2]/div[2]/a[1]/span[1]

And click in the proceed button
  Wait Until Element Is Visible    xpath=//h2[normalize-space()='Product successfully added to your shopping cart']
  Click Element    xpath=//span[normalize-space()='Proceed to checkout']

And click in the cart button
  Click Element    xpath=//div/a[@title='View my shopping cart']

When I click in the delete product of cart button
    Click Element    css=.icon-trash

Then the system should show the message "Your shopping cart is empty"
    Element Text Should Be    css=p.alert.alert-warning    ${EMPTY_CART_MESSAGE}

And that I click in the "Sign in" button going top right
    Click Element    css=a.login
    Element Should Be Visible    xpath=//h1[@class='page-heading']

And that I insert an email
    Input Text    xpath=//div/input[@id='email_create']    ${EMAIL}

And click in the "Create an account" button
    Click Element    id=SubmitCreate
    Element Should Be Visible    xpath=//h1[@class='page-heading']

And fill the mandatory fields
   Wait Until Element Is Visible    xpath=//h3[normalize-space()='Your personal information']
   Input Text       id=customer_firstname    ${FIRST_NAME}
   Input Text       id=customer_lastname     ${LAST_NAME}
   Input Text       id=passwd                ${PASSWORD}
   Input Text       id=firstname             ${FIRST_NAME}
   Input Text       id=lastname              ${LAST_NAME}
   Input Text       id=address1              ${ADDRESS}
   Input Text       id=city                  ${CITY}
   Click Element    id=id_state
   Click Element    css=select[id='id_state'] option[value='1']
   Input Text       id=postcode               ${ZIPCODE}
   Click Element    id=id_country
   Click Element    css=select[id='id_country'] option[value='21']
   Input Text       id=phone_mobile         ${MOBILE_PHONE}

When I click in the "Register" button to finish the registration
  Click Element    id=submitAccount

Then a management page of the account should appears
  Wait Until Element Is Visible    xpath=//h1[@class='page-heading']
  Element Text Should Be    css=a.account    ${FIRST_NAME} ${LAST_NAME}
