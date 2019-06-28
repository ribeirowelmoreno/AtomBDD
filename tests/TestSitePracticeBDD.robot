*** Settings ***
Resource          ../resource/Resource.robot
Test Setup        Open Browser
Test Teardown     Close Browser
Library           String

# SETUP run keyword before an suite or Test
# TEARDOWN run keyword after an suite or Test

*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    firefox

*** Test Cases ***
Scenario 1: Search an existant product
  Since I'm in the home page
  When I search for "Blouse" product
  Then the "Blouse" product should be listed in the webpage results

Scenario 2: Search an non existant product
  Since I'm in the home page
  When I search for "nonExitentItem" product
  Then the page should show the "No results were found for your search "nonExitentItem"" error message

Scenario 3: Pass the mouse on "Women" category on main menu
  Since I'm in the home page
  When I pass the mouse on the "Women" category
  Click in the "Summer Dresses" sub-category

Scenario 4: Add product to cart
  Since I'm in the home page
  When I search for "t-shirt" product
  Add product to cart

Scenario 5: Removing products from cart
  Since I'm in the home page
  When I search for "t-shirt" product
  Add product to cart
  Delete an product

Scenario 6: Add e new client
  Since I'm in the home page
  Create new account
  Submit register
  Make sure if the register was successfully done


*** Keywords ***
Since I'm in the home page
  Access home page

When I search for "${PRODUCT}" product
  Write the product name "${PRODUCT}" on the search field
  Click on the search button

Then the "${PRODUCT}" product should be listed in the webpage results
  Make sure ir the "${PRODUCT}" product was listed on the website

Then the page should show the "${ERROR_MESSAGE}" error message
  Check error message "${ERROR_MESSAGE}" was displayed

When I pass the mouse on the "${CATEGORY_TYPE}" category
  Mouse over item on the "${CATEGORY_TYPE}"

Click in the "${SUB_CATEGORY_TYPE}" sub-category
  Click in the "${SUB_CATEGORY_TYPE}"
  Make sure if all the items are showed in at the screen

Add product to cart
  Click on the "Add to cart" button
  Click on "Proceed to checkout"

Delete an product
  Press "delete button"

Create new account
  Click on "sign in" button
  Insert a valid e-mail
  Click on "Create new account" button
  Fill the required fields

Submit register
  Click on "submit" button

Make sure if the register was successfully done
  Check if the successfull message is displayed

# Create a random e-mail
#  [Arguments]              ${NAME}   ${LAST_NAME}
#  ${RANDOM_STRING}         Generate Random String
#  ${CUSTOM_EMAIL}          Set Variable    ${NAME}${LAST_NAME}${RANDOM_STRING}@testrobot.com
#  Log                      ${CUSTOM_EMAIL}
#  [Return]                 ${CUSTOM_EMAIL}
