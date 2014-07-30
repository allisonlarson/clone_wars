ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/app'
require 'simplecov'
require 'database_cleaner'


SimpleCov.start
DatabaseCleaner.strategy = :transaction
