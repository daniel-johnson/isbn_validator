# ISBN-13 format validator

This project was created for an interview test. It's validates the format of ISBN-13 numbers, as described by [wikipedia](https://en.wikipedia.org/wiki/International_Standard_Book_Number).

This project is created with ruby 2.6.3 and [sinatra.rb](https://github.com/sinatra/sinatra) and has been deployed to https://isbn13-validator.herokuapp.com/.

To run the application:
* download the repository
* install gems `bundle install`
* start application `bundle exec rackup -p 3000 config.ru &`

### Endpoints

**https://isbn13-validator.herokuapp.com/**
- Returns "Hello world!"

**https://isbn13-validator.herokuapp.com/:13_digit_isbn_number/validate**
- Returns a json response with a single 'message' value.
- Returns an HTTP status of 200 if the code is valid, 400 if it is not.

### Valid ISBN-13 Example
[https://isbn13-validator.herokuapp.com/9780306406157/validate](https://isbn13-validator.herokuapp.com/9780306406157/validate)
- Returns: `{"message":"ISBN-13: 9780306406157 is valid."}`

### Invalid ISBN-13 Examples
[https://isbn13-validator.herokuapp.com/978030640615/validate](https://isbn13-validator.herokuapp.com/978030640615/validate)
- Returns: `{"message":"ISBN-13: 978030640615 is invalid. Must be 13 digit integer"}`

[https://isbn13-validator.herokuapp.com/9780306406156/validate](https://isbn13-validator.herokuapp.com/9780306406156/validate)
- Returns: `{"message":"ISBN-13: 9780306406156 is invalid. Check digit is not correct."}`

## Final Note
If I was to continue working on this, I would write tests. Specifically I would test the helper methods, to make sure they output the correct results, and I would test the API for HTTP code and json format responses.
