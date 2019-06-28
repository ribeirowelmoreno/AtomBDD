***Settings***
Documentation    Suit to exemplify the IFs using on the tests
                 The IF should be little used, but sometimes it is must have


***Variable***
@{FRUTAS}     Maça    Banana      Uva     Abacaxi

***Test Case***
Test case first example
  Running a keyword with a condition = true
  Running a keyword with a condition = false
  Storing a value in a variable given a condition

***Keywords***
Running a keyword with a condition = true
  #Se for comparação entre duas strings, deve colocar aspas simples, se for comparação numérica, não é necessário
  Run Keyword If    '${FRUTAS[1]}' == 'Banana'      Log    The first item is a banana!

Running a keyword with a condition = false
  Run Keyword Unless    '${FRUTAS[1]}' == 'Maça'    Log    The first item is not a maça!

Storing a value in a variable given a condition
  ${VAR}      Set Variable If    '${FRUTAS[2]}' == 'Uva'      Uva
  Log         Mine variable VAR is a ${VAR}!!
