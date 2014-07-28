require_relative '../test_helper'
require 'capybara'
require 'sinatra'

class IntegrateTest < Minitest::Test
  include Rack::Test::Methods

  def app
    PlayerApp
  end
end
