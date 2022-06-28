# To Be Done [![CircleCI](https://dl.circleci.com/status-badge/img/gh/thanyabegum/to-be-done/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/thanyabegum/to-be-done/tree/main)

A Ruby on Rails applications for tracking what to read, watch, and listen to.

## Command Cheatsheet

### Installing Dependencies

```bundle install``` and ```yarn install```

### Starting Server

```bin/rails server``` or ```bin/rails s```

### Seeding Data

Run this command in the Heroku console ONCE after initial deployment. Running
more than once will throw an error because it will try to create a user with an
already used email address.

```bin/rails db:seed```

### Running Tests

```bundle exec rspec```
