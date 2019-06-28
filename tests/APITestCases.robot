***Settings***
Documentation       API Documentation: https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Resource            ../resource/ResourceAPI.robot
Suite Setup         Connecting my API

***Test Case***
Search all the books list (GET in all the books)
  Request all the books
  Check the status code     200
  Check the reason          OK
  Check if is returned a list with "200" books

Search an especific book (GET in only one book)
  Request the book "15"
  Check the status code     200
  Check the reason          OK
  Check if all 15's book data is returned correctly
Register a new book (POST)
  Register a new book
  Check if all the book's data are returned correctly
#TO-DO: Change a book (PUT)
#   - Check if all the data of the book 150 is successfully returned
#TO-DO: Delete a book (DELETE)
#   - Make sure the book 200 was been deleted
