*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${BROWSER}       chrome
${URL}           http://automationpractice.com
${PRODUCT}       Blouse

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

Type the name of the product "${PRODUCT}" in the search field
  Input Text  id=search_query_top  ${PRODUCT}

Click on search button
  Click Element    name=submit_search
