*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}    firefox
${URL}        http://automationpractice.com
&{PEOPLES_DATA}     first_name=Jose     last_name=Silva      password=jose2012?01     day_of_birth=10     month_of_birth=8     year_of_birth=1991     address=Rua Aguaçu, 171     city=Campinas     state=16    postcode=34711     country=21     phone_number=1999999999
@{SUMMER_DRESS_PRODUCTS}         Summer Dresses      Printed Summer Dress      Printed Summer Dress      Printed Chiffon Dress


*** Keywords ***
# SETUP e TEARDOWN
Open Browser
  SeleniumLibrary.Open Browser     about:blank    ${BROWSER}

Close Browser
  SeleniumLibrary.Close Browser

###Actions
Access home page
  Go To    http://automationpractice.com
  Maximize Browser Window
  Title Should Be    My Store

Write the product name "${PRODUCT}" on the search field
  Input Text    name=search_query    ${PRODUCT}

Click on the search button
  Click Element    name=submit_search

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

Click on "cart button" in order to show the products
  Wait Until Element Is Visible         xpath=//*[@id="header"]//a[@title="View my shopping cart"]
  Double Click Element                  xpath=//*[@id="header"]//a[@title="View my shopping cart"]

Press "delete button"
  Wait Until Element Is Visible         xpath=//*[@id="1_1_0_0"][@title="Delete"]
  Double Click Element                  xpath=//*[@id="1_1_0_0"][@title="Delete"]

Click on "sign in" button
  Wait Until Element Is Visible         xpath=//*[@id="header"]/div[2]//a[@class="login"]
  Click Element                         xpath=//*[@id="header"]/div[2]//a[@class="login"]

Create a random e-mail
  [Arguments]           ${NAME}     ${LAST_NAME}
  ${RANDOM_STRING}      Generate Random String
  ${CUSTOM_EMAIL}       Set Variable  ${NAME}${LAST_NAME}${RANDOM_STRING}@testrobot.com
  Log                   ${CUSTOM_EMAIL}
  [Return]              ${CUSTOM_EMAIL}

Insert a valid e-mail
  Wait Until Element Is Visible          id=email_create
  ${EMAIL}    Creating a custom e-mail     ${PEOPLES_DATA.first_name}     ${PEOPLES_DATA.last_name}
  Input Text                             id=email_create    ${EMAIL}

Click on "Create new account" button
  Wait Until Element Is Visible         xpath=//*[@id="SubmitCreate"]
  Double Click Element                  xpath=//*[@id="SubmitCreate"]

Fill the required fields
  Wait Until Element Is Visible         xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
  Click Element                         id=id_gender1
  Input Text                            xpath=//*[@id="customer_firstname"]    ${PEOPLES_DATA.first_name}
  Input Text                            xpath=//*[@id="customer_lastname"]     ${PEOPLES_DATA.last_name}
  Input Text                            xpath=//*[@id="passwd"]                ${PEOPLES_DATA.password}
  Set Focus To Element                  id=days
  Select From List By Index             id=days                                ${PEOPLES_DATA.day_of_birth}
  Set Focus To Element                  id=months
  Select From List By Index             id=months                              ${PEOPLES_DATA.month_of_birth}
  Execute Javascript                    window.scrollTo(0,500)
  # Run Keyword If                        '${BROWSER}'=='firefox'  Wait Until Element Is Visible   id=years
  Set Focus To Element                  xpath=//*[@id="years"]
  Select From List By Value             xpath=//*[@id="years"]                 ${PEOPLES_DATA.year_of_birth}
  Execute Javascript                    window.scrollTo(0,1000)

  Input Text                            id=address1                            ${PEOPLES_DATA.address}
  Input Text                            id=city                                ${PEOPLES_DATA.city}
  Set Focus To Element                  id=id_state
  Select From List By Index             id=id_state                            ${PEOPLES_DATA.state}
  Input Text                            id=postcode                            ${PEOPLES_DATA.postcode}
  Set Focus To Element                  id=id_country
  Select From List By Value             id=id_country                          ${PEOPLES_DATA.country}
  Execute Javascript                    window.scrollTo(0,1500)
  Input Text                            id=phone_mobile                        ${PEOPLES_DATA.phone_number}
  Input Text                            id=alias                               ${PEOPLES_DATA.address}

Click on "submit" button
  Click Element                         xpath=//*[@id="submitAccount"]/span[contains(text(),"Register")]

###Assertions

Check if the successfull message is displayed
   Wait Until Element Is Visible        xpath=//*[@id="center_column"]/p
   Element Text Should Be               xpath=//*[@id="center_column"]/p        Welcome to your account. Here you can manage all of your personal information and orders.
   Element Text Should Be               xpath=//*[@id="header"]/div[2]//div[1]/a/span    Jose Silva

Make sure ir the "${PRODUCT}" product was listed on the website
  Wait Until Element Is Visible         css=.page-heading
  Title Should Be                       Search - My Store
  Page Should Contain Image             xpath=//*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
  Page Should Contain Link              xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(), "Blouse")]

Make sure if all the items are showed in at the screen
  Page Should Contain Element           xpath=//*[@id="center_column"]/h1/span[contains(text(), "${SUMMER_DRESS_PRODUCTS[0]}")]
  Page Should Contain Element           xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a[@title="${SUMMER_DRESS_PRODUCTS[1]}"]
  Page Should Contain Element           xpath=//*[@id="center_column"]/ul/li[2]/div/div[2]/h5/a[@title="${SUMMER_DRESS_PRODUCTS[2]}"]
  Page Should Contain Element           xpath=//*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a[@title="${SUMMER_DRESS_PRODUCTS[3]}"]
