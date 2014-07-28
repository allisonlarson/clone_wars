require_relative 'integration_test_helper'

class IntegrationTest < IntegrateTest

  def test_it_goes_to_new_pages
    get '/'
    assert last_response.ok?
    get '/who_we_are'
    assert last_response.ok?
  end

  def test_it_logs_in
    post '/login', params: {
      user:     'ad',
      password: 'ad'
    }
    assert last_response.redirect?
    follow_redirect!
    assert last_response.ok?
  end

  def test_it_edits_pages
  end

  def test_it_creates_blog_post
  end

  def test_it_edits_blog_post
  end

  def test_it_deletes_blog_post
  end
end
