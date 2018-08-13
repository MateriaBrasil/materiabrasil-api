# MateriaBrasil - API

[![Maintainability](https://api.codeclimate.com/v1/badges/17a992dbbd55d69639eb/maintainability)](https://codeclimate.com/repos/5b085ac5bbf75a0289004e55/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/17a992dbbd55d69639eb/test_coverage)](https://codeclimate.com/repos/5b085ac5bbf75a0289004e55/test_coverage)

## Installation

#### Dependencies

[PostgreSQL](http://postgresql.org/)

Rbenv: [repo](https://github.com/rbenv/rbenv)

- Check that the rbenv PATH is configured correctly, according the repo instructions.

Rbenv-gemset: [repo](https://github.com/jf/rbenv-gemset)

#### Install ruby 2.5.1
```
$ rbenv install 2.5.1
```

If rbenv complains you don't have that ruby version, upgrade [ruby-build](https://github.com/rbenv/ruby-build#readme).

#### Clone the repository
```
$ git clone git@github.com:SeasonedSoftware/materiabrasil-api.git
$ cd materiabrasil-api
```

#### Install local bundler
```
$ gem install bundler
```

#### Use local bundler to install the other gems
Always use this command to ensure the gems are installed in `.gems`.
```
$ bin/bundle
```

#### Set the env vars
```
$ cp .env.sample .env
```
Ask a colleague for the values.

#### Prepare the database
```
$ bin/rails db:create db:migrate db:seed
```

#### Run the server
```
$ bin/rails s
```

You can check that it worked by browsing `localhost:3000/materials`. You should see a json file.

## Tests

#### Running tests
```
$ bin/rspec
```
The coverage will be available on the `coverage/` folder. Open `coverage/index.html` on your browser to see details.


#### Running the linter
```
$ bin/rubocop
```

## Deployment

### Staging

```
$ git remote add https://git.heroku.com/materiabrasil-api.git staging
$ git push staging master
```

### Production

To be added
