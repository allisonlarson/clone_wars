require 'capybara'
require 'capybara-webkit'
require 'sinatra'
require_relative '../test_helper'
require 'pry'

Capybara.javascript_driver = :webkit
Capybara.app = PlayerApp.new

class FeatureTest < MiniTest::Test
  include Capybara::DSL

  def setup
    DatabaseCleaner.start
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    DatabaseCleaner.clean
  end

end
