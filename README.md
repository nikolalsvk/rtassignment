[![Build Status](https://semaphoreci.com/api/v1/nikolalsvk/rtassignment/branches/master/shields_badge.svg)](https://semaphoreci.com/nikolalsvk/rtassignment)
[![Code Climate](https://codeclimate.com/github/nikolalsvk/rtassignment/badges/gpa.svg)](https://codeclimate.com/github/nikolalsvk/rtassignment)
[![Test Coverage](https://codeclimate.com/github/nikolalsvk/rtassignment/badges/coverage.svg)](https://codeclimate.com/github/nikolalsvk/rtassignment/coverage)

# RPG App

# THIS BRANCH IS USED TO TEST [render_async](https://github.com/renderedtext/render_async) WITH JQUERY

App for managing your fantasy characters

## Description

Ruby on Rails application written for acceptence to an
internship at Rendered Text.

It supports user registration and creating using Devise.

Each user can have their fantasy characters.

Each fantasy character has their own title, description and picture.
There are also character attributes which have title, value and a picture
that a user can upload.

All of the models and controllers are covered with RSpec tests at `spec`
directory. Test scenarios are written in Cucumber and are held inside
`feature` directory.

## Character combat

You can have your characters fight in a simulated combat. Result of the
combat will be the mix of their attributes and a bit of luck :crossed_swords:

## Installation

Clone this repository with:
```
git clone git@github.com:nikolalsvk/rtassignment.git
```

Run Rails server from inside cloned repo:
```
bundle exec rails server
```

Visit the app in [your browser](http://localhost:3000/)

Thanks for reading, if you have any question feel free to ask.

If you like the project or find it helpful, give it some :star: and :heart:.
Pull requests and contributions are welcome.

Happy coding!
