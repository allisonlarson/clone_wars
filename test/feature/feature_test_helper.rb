require_relative '../test_helper'
require 'capybara'
require 'sinatra'
require "rack_session_access/capybara"


Capybara.app = PlayerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

end
