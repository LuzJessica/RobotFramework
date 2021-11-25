*** Settings ***

Documentation                   API Documentation https://fakerestapi.azurewebsites.net/index.html#!/Books
Library                         RequestsLibrary
Library                         Collections

*** Variable ***

${URL}          https://fakerestapi.azurewebsites.net/api/v1

*** Keywords ***

Connect to my API
   Create Session    fakeAPI    ${URL}

Require all the books
   ${RESPONSE}  Get On Session  fakeAPI  Books
   Log       ${RESPONSE.text}
   Set Test Variable    ${RESPONSE}


Check if status code is 200
   Status Should Be  200    ${RESPONSE}

Check if reason is OK
   Should Be Equal As Strings  OK  ${RESPONSE.reason}

Check if the API returns a list with 200 books
   Length Should Be    ${RESPONSE.json()}    200
