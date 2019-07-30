# MateriaBrasil - API

[![Maintainability](https://api.codeclimate.com/v1/badges/17a992dbbd55d69639eb/maintainability)](https://codeclimate.com/repos/5b085ac5bbf75a0289004e55/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/17a992dbbd55d69639eb/test_coverage)](https://codeclimate.com/repos/5b085ac5bbf75a0289004e55/test_coverage)

# Installation

## Install Dependencies

### 1. Install PostgreSQL

[PostgreSQL](http://postgresql.org/)

### 2. Install Rbenv

Rbenv: [repo](https://github.com/rbenv/rbenv)

- Check that the rbenv PATH is configured correctly, according to the repo instructions.

### 3. Install Rbenv-gemset

Rbenv-gemset: [repo](https://github.com/jf/rbenv-gemset)

### 4. Install ruby 2.5.1
```
$ rbenv install 2.5.1
```

If rbenv complains you don't have that ruby version, upgrade [ruby-build](https://github.com/rbenv/ruby-build#readme).

## Setup the project

### Clone the repository
```
$ git clone git@github.com:SeasonedSoftware/materiabrasil-api.git
$ cd materiabrasil-api
```

### Install local bundler
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

### Use local bundler to install the other gems
Always use this command to ensure the gems are installed in `.gems`.
```
$ bin/bundle
```

### Set the env vars
```
$ cp .env.sample .env
```
Ask a colleague for the values.

### Prepare the database
```
$ bin/rails db:create db:migrate db:seed
```

# TOPSIS Calculations

Every Material has 4 percentage indicators showing the "score" for each driver
(Humano Social, Gestão e Governança, Processo, Matéria Prima).

Those drivers are responsible for the percentage score on the Graph showed on the
Material page. The algorithm we use to calculate those drivers are called **[TOPSIS](https://en.wikipedia.org/wiki/TOPSIS)**.

Currently we have all those calculations separated inside Service Objects localted at
`app/services/topsis`.

**The correct used service to calculate a final percentage for some current Questionnaire
is `Topsis::CalculateDriverPercentage.execute(driver, supplier_or_material)`**.
Driver is the field `driver` of Questionnaire, and the second argument receive either
Supplier (for Humano Social & Gestão e Governança calculations) and a Material (for
Processo & Matéria Prima calculations).

The other service objects are supplementary and act as helpers for the main Service.
Today we don't run the TOPSIS manually, **it runs when you finish answering all the
questions from some Questionnaire OR when admin manually trigger the calculations
FOR THE ENTIRE PLATFORM.**

## Services
- Topsis::NormalizeBaseForQuestionnaires
  - Return the normalized value that each question will have for some questionnaire
- Topsis::CalculateAnswerWeight
  - Each answer will have it's own weight and will vary based on the `type_of_company`
- Topsis::MinMaxDistances / Topsis::MinMaxScenarios
  - TOPSIS work with min & max values/weights. This service calculate how far you're from each ideal and worst scenarios for the answered question
- Topsis::CalculateDriverPercentage
  - Will calculate the final percentage for the Supplier/Material and the Questionnaire you passed as argument

## Jobs
- CalculateTopsisJob
  - Will calculate the TOPSIS for 1 questionnaire only
- CalculateAllTopsisJob
  - Admin can trigger this to re-calculate the ENTIRE database values

# Running the project, specs & more

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


## Running the linter
```
$ bin/rubocop
```

# Deployment

## Staging

```
$ git remote add https://git.heroku.com/materiabrasil-api.git staging
$ git push staging master
```

## Production

To be added
