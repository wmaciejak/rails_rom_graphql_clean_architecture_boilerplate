# frozen_string_literal: true
def connection_params
  uri = URI.parse(ENVied.DATABASE_URL)
  {
    user: uri.user,
    password: uri.password,
    host: uri.host,
    port: uri.port,
  }
end

DB = Sequel.postgres("template1", connection_params)

def create_db(name)
  DB.run "CREATE DATABASE #{name}"
  $stdout.puts "#{name} created"
rescue Sequel::DatabaseError
  $stdout.puts "WARN: #{name} already exists. Skipping..."
end

def drop_db(name)
  DB.run "DROP DATABASE #{name}"
  $stdout.puts "#{name} dropped"
rescue Sequel::DatabaseError
  $stdout.puts "WARN: #{name} doesn't exist. Skipping..."
end

namespace :db do
  namespace :seed do
    load(File.join(Rails.root, 'db', 'seeds.rb'))
    task development: :environment do
      Seeds::Runner.start!('development')
    end
  end

  task :create do
    uri = URI.parse(ENVied.DATABASE_URL)
    database_name = uri.path[1..-1]
    create_db(database_name)
  end

  task :drop do
    uri = URI.parse(ENVied.DATABASE_URL)
    database_name = uri.path[1..-1]
    drop_db(database_name)
  end

  namespace :test do
    task :prepare do
      abort('Production environment. Aborting...') if Rails.env.production?
      system 'RACK_ENV=test bundle exec rake db:drop db:create db:migrate'
    end
  end
end
