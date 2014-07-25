require 'minitest/spec'
require 'rack/test'

describe 'Integration Tests' do
  include Rack::Test::Methods

  def app
    PlayersApp
  end

  it 'goes to new pages' do
    get '/'
    assert last.response.ok?
  end
end
