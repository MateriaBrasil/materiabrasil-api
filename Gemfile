# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'

gem 'kaminari'
gem 'awesome_print'
gem 'committee'
gem 'devise-i18n'
gem 'devise_token_auth'
gem 'excon', '>= 0.62.0'
gem 'prmd'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pg_search'
gem 'puma', '~> 3.11'
gem 'pundit'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.2.0'
gem 'rails-i18n', '~> 5.1.1'
gem 'state_machines-activerecord', '~> 0.5.2'
gem 'quick_random_records'


gem 'friendly_id', '~> 5.2.4'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'faker'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'mailcatcher'
  gem 'rspec-rails', '~> 3.7'
  gem 'rspec_junit_formatter'
  gem 'rubocop', '~> 0.52.0', require: false
  gem 'rubocop-rspec', require: false
  gem 'shoulda-matchers',
    github: 'thoughtbot/shoulda-matchers', branch: 'rails-5'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end
