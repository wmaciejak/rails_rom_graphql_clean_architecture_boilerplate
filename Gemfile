# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.4.2"

gem "rails", "5.1.4"

gem "rom", "4.0.0"
gem "rom-rails", "1.0.0.rc1"
gem "rom-sql", "2.0.0"

gem "dry-container", "0.6.0"

gem "pg", "0.21.0"
gem "sequel", "5.1.0"

gem "batch-loader", "1.0.4"
gem "graphiql-rails", "1.4.5"
gem "graphql", "1.7.4"

gem "envied", "0.9.1"
gem "puma", "3.10.0"

group :development, :test do
  gem "pry-rails", "0.3.6"

  # Security & analysis
  gem "brakeman", "4.0.1"
  gem "bundler-audit", "0.6.0"
  gem "rubocop", "0.50.0"
  gem "rubocop-rspec", "1.18.0"

  # Required by working graphiql
  gem "coffee-rails", "4.2.2"
  gem "sass-rails", "5.0.6"
  gem "uglifier", "3.2.0"
end

group :test do
  gem "database_cleaner", "1.6.1"
  gem "rspec-rails", "3.6.1"
end

group :development do
  gem "listen", "3.1.5"
end
