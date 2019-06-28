***Settings***
Documentation       API Documentation: https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Library             RequestsLibrary
Library             Collections


***Variable***
${URL_API}          https://fakerestapi.azurewebsites.net/api/
&{BOOK_15}          ID=15
...                 Title=Book 15
...                 PageCount=1500

#Tres pontos serve para dar continuidade na declaração dentro da variável, como se tudo estivesse na mesma linha


***Keywords***
###SETUP AND TEARDOWNS
Connecting my API
  Create Session    fakeAPI    ${URL_API}

###Actions
Request all the books
#Faz uma requisição na API e retorna todos os livros cadastrados
  ${ANSWER}         Get Request     fakeAPI    Books
  Log               ${ANSWER.text}
  #Define que essa variavel vai ser global, ou seja, usada em todos as Keywords que quiser
  Set Test Variable    ${ANSWER}

Request the book "${BOOK_ID}"
  ${ANSWER}         Get Request     fakeAPI    Books/${BOOK_ID}
  Log               ${ANSWER.text}
  #Define que essa variavel vai ser global, ou seja, usada em todos as Keywords que quiser
  Set Test Variable    ${ANSWER}

Register a new book
  ${HEADERS}        Create Dictionary    content-type=application/json
  ${ANSWER}         Post Request    fakeAPI    Books
  #Está nesse formato usando os trÊs pontos, porque na Library Collections o Post Request tem os argumentos opcionais, e respeiam uma ordem de declaração. Declarando assim, podemos declarar somente o que precisamos.
  ...                               data={"ID": 4215,"Title": "teste","Description": "teste","PageCount": 200,"Excerpt": "teste","PublishDate": "2019-06-28T18:20:13.832Z"}
  ...                               headers=${HEADERS}
  Log               ${ANSWER.text}
  Set Test Variable    ${ANSWER}


###Conferences
#Verificar se o status code retornou o que era espearado (200 livors)
Check the status code
  [Arguments]       ${WANTED_STATUSCODE}
  #A string ${ANSWER.status_code} deve ser igual à ${WANTED_STATUSCODE}
  Should Be Equal As Strings    ${ANSWER.status_code}    ${WANTED_STATUSCODE}

#Verificar se o retorno do reason está como OK
Check the reason
  [Arguments]       ${WANTED_REASON}
  Should Be Equal As Strings    ${ANSWER.reason}    ${WANTED_REASON}

#Checar se o tamanho da lista retornada é o tamanho desejado
Check if is returned a list with "${BOOKS_QUANTITY}" books
  Length Should Be    ${ANSWER.json()}    ${BOOKS_QUANTITY}

Check if all 15's book data is returned correctly
  Dictionary Should Contain Item    ${ANSWER.json()}    ID              ${BOOK_15.ID}
  Dictionary Should Contain Item    ${ANSWER.json()}    Title           ${BOOK_15.Title}
  Dictionary Should Contain Item    ${ANSWER.json()}    PageCount       ${BOOK_15.PageCount}

  Should Not Be Empty               ${ANSWER.json()["Description"]}
  Should Not Be Empty               ${ANSWER.json()["PublishDate"]}
  Should Not Be Empty               ${ANSWER.json()["Excerpt"]}

Check if all the book's data are returned correctly
  Dictionary Should Contain Item    ${ANSWER.json()}    data    value
