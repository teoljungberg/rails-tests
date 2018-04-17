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
  gem "sqlite3"
  gem "pry"
end

require "active_record"
require "minitest/autorun"
require "logger"

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:",
)
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  create_table :posts, force: true do |t|
  end
end

class Post < ActiveRecord::Base
end

class PostTest < Minitest::Test
end
