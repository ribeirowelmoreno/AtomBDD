***Settings***
Documentation       API Documentation: https://fakerestapi.azurewebsites.net/swagger/ui/index#/Books
Resource            ../resource/ResourceAPI.robot
Setup               Connecting my API

***Test Case***
Search all the books list (GET in all the books)
  Request all the books
#   - Check if is returned a list with 200 books
#TO-DO: Search an especific book (GET in only one book)
#   - Check if all 15's book data is returned correctly
#TO-DO: Register a new book (POST)
#   - Check if all the book's data are returned correctly
#TO-DO: Change a book (PUT)
#   - Check if all the data of the book 150 is successfully returned
#TO-DO: Delete a book (DELETE)
#   - Make sure the book 200 was been deleted
