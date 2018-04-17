begin
  require "bundler/inline"
rescue LoadError => e
  $stderr.puts "Bundler version 1.10 or later is required. Please update your Bundler"
  raise e
end

gemfile(true) do
  source "https://rubygems.org"
  if ENV["EDGE"]
    gem "rails", path: File.expand_path("../../../rails", __FILE__)
  elsif ENV["VERSION"]
    gem "rails", ENV["VERSION"]
  else
    gem "rails"
  end
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

class Minitest::Test
  def setup
    DatabaseCleaner.start
    super
  end

  def teardown
    DatabaseCleaner.clean
    super
  end
end

ActiveRecord::Schema.define do
  create_table :posts, force: true do |t|
  end
end

class Post < ActiveRecord::Base
end

class PostTest < Minitest::Test
end
