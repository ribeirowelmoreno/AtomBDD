***Settings***
Documentation       API Documentation: https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Library             RequestsLibrary
Library             Collections


***Variable***
${URL_API}          https://fakerestapi.azurewebsites.net/api/
&{BOOK_15}          ID=15
...                 Title=Book 15
...                 PageCount=1500
&{BOOK_201}         ID=201
...                 Title=New Book
...                 PageCount=500
...                 Description=My Book
...                 Excerpt=My book is the better
...                 PublishDate=2018-06-26T18:00:17.765Z
&{BOOK_150}         ID=150
...                 Title=Book 150
...                 PageCount=600
...                 Description=Test
...                 PageCount=600
...                 Excerpt=Test
...                 PublishDate=2019-07-01T12:28:13.339Z

#Tres pontos serve para dar continuidade na declaração dentro da variável, como se tudo estivesse na mesma linha


***Keywords***
###SETUP AND TEARDOWNS
Connecting my API
  Create Session    fakeAPI    ${URL_API}
  ${HEADERS}        Create Dictionary    content-type=application/json
  Set Suite Variable    ${HEADERS}

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
  ${ANSWER}         Post Request    fakeAPI    Books
  #Está nesse formato usando os trÊs pontos, porque na Library Collections o Post Request tem os argumentos opcionais, e respeiam uma ordem de declaração. Declarando assim, podemos declarar somente o que precisamos.
  ...                               data={"ID": ${BOOK_201.ID},"Title": "${BOOK_201.Title}","Description": "${BOOK_201.Description}","PageCount": ${BOOK_201.PageCount},"Excerpt": "${BOOK_201.Excerpt}","PublishDate": "${BOOK_201.PublishDate}"}
  ...                               headers=${HEADERS}
  Log               ${ANSWER.text}
  Set Test Variable    ${ANSWER}

Change the book "${ID_BOOK}"
  ${ANSWER}         Put Request     fakeAPI    Books/${ID_BOOK}
  ...                               data={"ID": ${BOOK_150.ID},"Title": "${BOOK_150.Title}","Description": "${BOOK_150.Description}","PageCount": ${BOOK_150.PageCount},"Excerpt": "${BOOK_150.Excerpt}","PublishDate": "${BOOK_150.PublishDate}"}
  ...                               headers=${HEADERS}
  Log               ${ANSWER.text}
  Set Test Variable    ${ANSWER}

Delete a book "${ID_BOOK}"
  ${ANSWER}         Delete Request    fakeAPI    Books/${ID_BOOK}
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

Check if all the book's data are returned correctly for the book "${ID_BOOK}"
  Check book        ${ID_BOOK}

Check if all the data of the book "${ID_BOOK}" is successfully returned
  Check book        ${ID_BOOK}

Make sure the book "${ID_BOOK}" was been deleted
#Checa se o Response Body está vazio, provando assim que o livro foi excluido
  Should Be Empty    ${ANSWER.content}

Check book
  [Arguments]       ${ID_BOOK}
  Dictionary Should Contain Item    ${ANSWER.json()}    ID              ${BOOK_${ID_BOOK}.ID}
  Dictionary Should Contain Item    ${ANSWER.json()}    Title           ${BOOK_${ID_BOOK}.Title}
  Dictionary Should Contain Item    ${ANSWER.json()}    Description     ${BOOK_${ID_BOOK}.Description}
  Dictionary Should Contain Item    ${ANSWER.json()}    PageCount       ${BOOK_${ID_BOOK}.PageCount}
  Dictionary Should Contain Item    ${ANSWER.json()}    Excerpt         ${BOOK_${ID_BOOK}.Excerpt}
  Dictionary Should Contain Item    ${ANSWER.json()}    PublishDate     ${BOOK_${ID_BOOK}.PublishDate}
