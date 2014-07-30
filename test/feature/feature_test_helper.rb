require_relative '../test_helper'
require 'capybara'
require 'capybara-webkit'
require 'sinatra'


Capybara.javascript_driver = :webkit
Capybara.app = PlayerApp.new

class FeatureTest < Minitest::Test
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
