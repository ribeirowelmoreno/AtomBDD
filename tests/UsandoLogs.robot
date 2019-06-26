***Settings***
Documentation   Suit to exemplify the Logs using on tests
                The Logs are very useful, do Logs to analyze how your test is being performed
                The Logs helps to find errors on the your tests automation
Library         SeleniumLibrary

***Variables***
@{FRUTAS}     Maça  Banana  Uva  Abacaxi

***Test Case***
First test case
  Using LOG for messages
  Using LOG Console
  Using screenshots

***Keywords***
Using LOG for messages
  Log       My LOG message
  ${VAR}    Set Variable    any variable
  Log       I can log ${VAR} in the middle of the log

Using LOG Console
  Log To Console      I can log in the log output
  Log Many            I can log my complete list @{FRUTAS}
  Log                 I can log only some items from my list ${FRUTAS[0]} - ${FRUTAS[1]}

Using screenshots
  Log       On the web tests, we can log an screenshots with SeleniumLibrary
  Open Browser    http://www.robotizandotestes.blogspot.com.br       firefox
  Capture Page Screenshot       screenshot_test.png
  Close Browser   
