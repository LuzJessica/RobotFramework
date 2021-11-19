*** Settings ***
###SETUP runs keyword before suite or test case
###TEARDOWN runs keyword after suite or test case
###We can define in setting or also in testcases. When defined in testcases, the preference to execute is the command in the block testcases


Resource         ../resource/Resource.robot
Test Setup       Open Browser
Test Teardown    Close Browser


*** Test Case ***

Scenario 01: Search existent product
  Given then I'm in the website homepage
  When I search for the product "Blouse"
  Then the product "Blouse" should be listed

Scenario 02: Search inexistent product
  Given then I'm in the website homepage
  When I search for the product "Whatever"
  Then the error message "No results were found for your search "Whatever"" should be returned
