# MateriaBrasil - API

[![Maintainability](https://api.codeclimate.com/v1/badges/17a992dbbd55d69639eb/maintainability)](https://codeclimate.com/repos/5b085ac5bbf75a0289004e55/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/17a992dbbd55d69639eb/test_coverage)](https://codeclimate.com/repos/5b085ac5bbf75a0289004e55/test_coverage)

## Installation

### Install Dependencies

#### 1. Install PostgreSQL

[PostgreSQL](http://postgresql.org/)

#### 2. Install Rbenv

Rbenv: [repo](https://github.com/rbenv/rbenv)

- Check that the rbenv PATH is configured correctly, according to the repo instructions.

#### 3. Install Rbenv-gemset

Rbenv-gemset: [repo](https://github.com/jf/rbenv-gemset)

#### 4. Install ruby 2.5.1
```
$ rbenv install 2.5.1
```

If rbenv complains you don't have that ruby version, upgrade [ruby-build](https://github.com/rbenv/ruby-build#readme).

### Setup the project

#### Clone the repository
```
$ git clone git@github.com:SeasonedSoftware/materiabrasil-api.git
$ cd materiabrasil-api
```

#### Install local bundler
Make sure you're running the correct ruby version. Run:

```
rbenv versions
```
It should return something like:
```
system
...(other ruby versions installed)...
* 2.5.1 (set by /home/<path-to-repo-folder>/materiabrasil-api/.ruby-version)

```
Make sure you're using the correct gemset. Run:
```
rbenv gemset active
```
It should return:
```
.gems global
```

If both are ok, run:
```
$ gem install bundler
```
Verify that the bundler was installed inside `materiabrasil-api/.gems` folder.

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

## Running the server
```
$ bin/rails s
```

You can check that it worked by browsing `localhost:3000/materials`. You should see a json file.

## Using Mailcatcher

After starting the server, you can access on the following URL (works with Docker):

```
$ localhost:8080
```

For Docker, use this

## Tests
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
