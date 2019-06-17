*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    firefox
${URL}        http://automationpractice.com

*** Keywords ***
# SETUP e TEARDOWN
Open Browser
  SeleniumLibrary.Open Browser     about:blank    ${BROWSER}

Close Browser
  SeleniumLibrary.Close Browser

# Step-by-Step
Access home page
  Go To    http://automationpractice.com
  Maximize Browser Window
  Title Should Be    My Store

Write the product name "${PRODUCT}" on the search field
  Input Text    name=search_query    ${PRODUCT}

Click on the search button
  Click Element    name=submit_search

Make sure ir the "${PRODUCT}" product was listed on the website
  Wait Until Element Is Visible         css=.page-heading
  Title Should Be                       Search - My Store
  Page Should Contain Image             xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
  Page Should Contain Link              xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "Blouse")]

Check error message "${ERROR_MESSAGE}" was displayed
  Wait Until Element Is Visible         xpath=//*[@id="center_column"]//p[@class="alert alert-warning"]
  Element Text Should Be                xpath=//*[@id="center_column"]//p[@class="alert alert-warning"]    ${ERROR_MESSAGE}

Mouse over item on the "${CATEGORY_TYPE}"
  Wait Until Element Is Visible         xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORY_TYPE}"]
  Mouse Over                            xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORY_TYPE}"]

Click in the "${SUB_CATEGORY_TYPE}"
  Wait Until Element Is Visible         xpath=//*[@id="block_top_menu"]//a[@title="${SUB_CATEGORY_TYPE}"]
  Click Element                         xpath=//*[@id="block_top_menu"]//a[@title="${SUB_CATEGORY_TYPE}"]

Click on the "Add to cart" button
  Wait Until Element Is Visible         xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
  Click Element                         xpath=//*[@id="center_column"]//img[@alt="Faded Short Sleeve T-shirts"]
  Execute Javascript                    window.scrollTo(0,300);
  Wait Until Element Is Visible         xpath=//*[@id="add_to_cart"]/button
  Click Button                          xpath=//*[@id="add_to_cart"]/button

Click on "Proceed to checkout"
  Wait Until Element Is Visible         xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
  Click Element                         xpath=//*[@id="layer_cart"]//a[@title="Proceed to checkout"]
