require 'minitest/spec'
require 'rack/test'
require_relative  '../lib/app'

describe 'Integration Tests' do
  include Rack::Test::Methods

  def app
    PlayersApp
  end

  it 'goes to new pages' do
    #goes to index
    get '/'
    assert last.response.ok?

    #goes to new page
    get '/who-we-are'
    assert last.response.ok?
  end
end
