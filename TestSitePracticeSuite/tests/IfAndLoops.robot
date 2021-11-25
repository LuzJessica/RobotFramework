*** Setting ***

*** Variables ***

@{NUMBERS}          1  2  3  4  5  6  7  8  9  10

*** Test case ***

Assignment 5 - Playing with IF and LOOPS
  Print number

*** Keywords ***

Print number
   Log To Console    ${\n}
   FOR  ${NUMBER}  IN  @{NUMBERS}
     IF  ${NUMBER}==${NUMBERS[4]} or ${NUMBER}==${NUMBERS[9]}
           Log To Console    "I'm the number: " ${NUMBER}
     ELSE
           Log To Console    "I'm not the number 5 or 10 "
     END
   END
