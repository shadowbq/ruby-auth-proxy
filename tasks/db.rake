require './app.rb'
require 'database_cleaner'
include Rake::DSL

desc "flush the db"
task "db:clean" do
  DatabaseCleaner.strategy = :truncation
    # then, whenever you need to clean the DB
  DatabaseCleaner.clean
end
