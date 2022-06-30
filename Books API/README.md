### Books API using SQlite3

BASE_URL = https://bookapisqlite.herokuapp.com/

### Add a New Book

Parameters:

- title
- year
- author

POST => /api

Response

```json
{
    "message": "Book inserted successfully"
}

```

### Get All Books

GET => /api/all

Response

```json
[
    {
        "id": 1,
        "title": "My Book",
        "author": "I",
        "year": 2015
    },
    {
        "id": 2,
        "title": "My Book Two",
        "author": "Ramesh",
        "year": 2011
    },
    {
        "id": 3,
        "title": "Harry Potter",
        "author": "JK Rowling",
        "year": 2005
    },
    {
        "id": 4,
        "title": "Hello",
        "author": "Hey Gupta",
        "year": 2017
    }
]
```

### Get a Book with ID

GET => /api/{id}

Response

```json
    {
        "id": 4,
        "title": "Hello",
        "author": "Hey Gupta",
        "year": 2017
    }
```

### Update Book

PUT => /api/update/{id}

Parameters are key value pairs whatever you want to update title,author,or year


```json
{ 
 "message": "Book updated successfully" 
}
```

### Delete a Book

DELETE => /api

Parameter:

- id


Response

```json
{ 
 "message": "Book deleted successfully" 
 }
```
