require_relative 'integration_test_helper'

class IntegrationTest < IntegrateTest

  def test_it_goes_to_new_pages
    get '/'
    assert last_response.ok?
    get '/who_we_are'
    assert last_response.ok?
  end
end
