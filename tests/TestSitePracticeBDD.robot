*** Settings ***
Resource          ../resource/Resource.robot
Test Setup       Open Browser
Test Teardown    Close Browser

# SETUP run keyword before an suite or Test
# TEARDOWN run keyword after an suite or Test

*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    firefox

*** Test Cases ***
# Scenario 1: Search an existant product
#   Since I'm in the home page
#   When I search for "Blouse" product
#   Then the "Blouse" product should be listed in the webpage results
#
# Scenario 2: Search an non existant product
#   Since I'm in the home page
#   When I search for "nonExitentItem" product
#   Then the page should show the "No results were found for your search "nonExitentItem"" error message

Scenario 3: Pass the mouse on "Women" category on main menu
    Since I'm in the home page
    When I pass the mouse on the "Women" category
    Click in the "Summer Dresses" sub-category

  # Scenario 4: Click in the "Summer Dresses" sub category
  #   Since I'm in "Women" category
  #   When I click in "Summer Dresses" category
  #   An page should be displayed when all the products


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
  Mouse over item

Click in the "Summer Dresses" sub-category
  Click in the "${SUB_CATEGORY_TYPE}" sub-category
