*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${BROWSER}       chrome
${URL}           http://automationpractice.com
${EXISTENT_PRODUCT}       Blouse
${INEXISTENT_PRODUCT}       Whatever

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
