*** Settings ***

Documentation        API Documentation https://fakerestapi.azurewebsites.net/index.html#!/Books
Resource             ResourceAPI.robot
Suite Setup          Connect to my API

*** Test Case ***

List all books (GET all books)
   Require all the books
   Check if status code is 200
  # Check if the API returns a list with 200 books
