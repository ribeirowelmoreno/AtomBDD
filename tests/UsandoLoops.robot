***Settings***
Documentation     Suit to exemplify the Loops using on the tests
                  The Loops should be little used, but sometimes doesn't have another way
                  and we need him, so let's go how it is!
                  The Loop for is not supported in Robot as a keyword-driven structure.
                  But the Robor creater already said they are working in a solution for this!

***Variable***
@{FRUTAS}         Maça      Banana      Uva       Abacaxi

***Test Case***
Test case for exemple 01
  Using FOR with RANGE
  Using FOR with LIST
  Leaving a FOR
  Using an keyword REPEAT

***Keywords***
Using FOR with RANGE
  :FOR     ${COUNT}      IN RANGE      1     6
  \        Log    My current counter is: ${COUNT}. The range will be from 1 to 5!
  \        Run Keyword If    ${COUNT} == 5    Log    The loop is finished!

Using FOR with LIST
  :FOR    ${ITEM}        IN       @{FRUTAS}
  \       Log    My fruit is: ${ITEM}
  \       Run Keyword If    '${ITEM}' == 'Abacaxi'    Log    The loop is finished!

Leaving a FOR
  :FOR    ${ITEM}        IN       @{FRUTAS}
  \       Exit For Loop If        '${ITEM}' == 'Uva'
  \       Log    My fruit is: ${ITEM}

Using an keyword REPEAT
  Repeat Keyword    4    Log    Let's log this phrase four times!!!
