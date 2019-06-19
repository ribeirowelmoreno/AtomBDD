***Settings***

Documentation    Exemple of types of variables: SIMPLE, LIST and DICTIONARIES

***Variables***

#SIMPLE
${GLOBAL_SIMPLE}     Let's see the kind of variables on robot!

#LIST
@{FRUIT}             strawberry    banana    apple    grape    pineapple

#DICTIONARIES
&{PEOPLES}           first_name=Wellynton Ribeiro Moreno     email=ribeirowelmoreno@gmail.com     age=28     gender=male

***Test Cases***
Test case example 01:
  Any keyword 01

***keyword***
Any keyword 01

#SIMPLE
  Log    ${GLOBAL_SIMPLE}

#LIST
  Log    Should be apple: ${FRUIT[2]} and this should be strawberry: ${FRUIT[0]}

#DICTIONARIES
  Log    Nome: ${PEOPLES.first_name} and e-mail: ${PEOPLES.email}
