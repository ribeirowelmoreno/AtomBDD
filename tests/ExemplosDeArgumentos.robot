***Settings***
Documentation       Exemplo de uso de variáveis  como argumentos em keywords

***Variables***
&{PEOPLE}           name=Wellynton Ribeiro Moreno       email=ribeirowelmoreno@gmail.com       age=17       gender=male


***TEST CASES***
Tets case example 01
  Any keyword 01


***Keywords***
Any keyword 01
  An sub-keyword with argument      ${PEOPLE.name}      ${PEOPLE.email}
  ${ALERT_MESSAGE}    A sub-keyword with return       ${PEOPLE.name}      ${PEOPLE.age}
  Log    ${ALERT_MESSAGE}

An sub-keyword with argument
  [Arguments]     ${USER_NAME}      ${USER_EMAIL}
  Log             User name: ${USER_NAME}
  Log             Email: ${USER_EMAIL}

A sub-keyword with return
  [Arguments]     ${USER_NAME}      ${USER_AGE}
  ${MESSAGE}      Set Variable If    ${USER_AGE}<18     Not autorized! The user ${USER_NAME} is minor!
  [Return]        ${MESSAGE}
