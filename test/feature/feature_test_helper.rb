require_relative '../test_helper'
require 'capybara'
require 'sinatra'


Capybara.app = PlayerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
