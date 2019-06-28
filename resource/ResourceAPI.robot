***Settings***
Documentation       API Documentation: https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Library             RequestsLibrary
Library             Collections


***Variable***
${URL_API}          https://fakerestapi.azurewebsites.net/api/

***Keywords***
###SETUP AND TEARDOWNS
Connecting my API
  Create Session    fakeAPI    ${URL_API}

###Actions
Request all the books
  ${ANSWER}         Get Request    fakeAPI    Books
  Log               ${ANSWER.text}
