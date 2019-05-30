*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome

*** Test Cases ***
Test Case 1: Search an existant product
  Acess home page
  Make sure if the page was loaded
  Write the product name "Blouse" on the search field
  Click on the search button
  Make sure ir the "Blouse" product was listed on the website

Test Case 2: Search an non existant product
  Acess home page
  Make sure if the page was loaded
  Write the product name "nonExitentItem" on the search field
  Click on the search button
  Ceck error message "No results were found for your search "nonExitentItem"" was displayed


*** Keywords ***
