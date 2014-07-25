require 'minitest/spec'
require 'rack/test'

describe 'Integration Tests' do
  include Rack::Test::Methods

  def app
    PlayersApp
  end

  it 'goes places' do
  end
end
