*** Settings ***

Resource         ../resource/Resource.robot
Test Setup       Open Website
#Test Teardown    Close Website

*** Test Case ***
Test Case 01: Search existent product
   Access the website homepage
   Type the name of the product "Blouse" in the search field
   Click on search button
#        Check if the product "Blouse" was returned in the list

#    Test Case 02: Search inexistent product
#        Access the website homepage
#        Check if the webpage was show
#        Type the name of the product "Whatever" in the search field
#        Click on search button
#        Check if the error message "No results were found for your search "Whatever"" was returned

#*** Keywords ***
