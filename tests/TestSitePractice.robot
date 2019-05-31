*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Open Browser
Test Teardown   Close Browser

*** Test Cases ***
Test Case 1: Search an existant product
  Access home page

  Write the product name "Blouse" on the search field
  Click on the search button
  Make sure ir the "Blouse" product was listed on the website

Test Case 2: Search an non existant product
  Access home page

  Write the product name "nonExitentItem" on the search field
  Click on the search button
  Ceck error message "No results were found for your search "nonExitentItem"" was displayed


*** Keywords ***
