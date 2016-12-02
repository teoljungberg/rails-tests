begin
  require "bundler/inline"
rescue LoadError => e
  $stderr.puts "Bundler version 1.10 or later is required. Please update your Bundler"
  raise e
end

gemfile(true) do
  source "https://rubygems.org"
  gem "rails", path: File.expand_path("../../../../rails", __FILE__)
  gem "pg"

  gem "database_cleaner"
  gem "pry"
end

require "active_record"
require "minitest/autorun"
require "logger"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "test",
)
ActiveRecord::Base.logger = Logger.new(STDOUT)

DatabaseCleaner.strategy = :transaction

ActiveRecord::Schema.define do
  create_table :posts, force: true do |t|
  end
end

class Post < ActiveRecord::Base
end

class PostTest < Minitest::Test
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
