require_relative 'integration_test_helper'

class IntegrationTest < IntegrateTest

  def test_it_loads_who_we_are
    get '/'
    assert last_response.ok?
    get '/who_we_are'
    assert last_response.ok?
    assert last_response.body.include?("who we are!")
  end

  def test_it_loads_what_we_carry
    get '/'
    assert last_response.ok?
    get '/what_we_carry'
    assert last_response.ok?
    assert last_response.body.include?("what we carry!")
  end

  def test_it_loads_what_we_do
    get '/'
    assert last_response.ok?
    get '/what_we_do'
    assert last_response.ok?
    assert last_response.body.include?("what we do!")
  end

  def test_it_loads_outfit_of_the_week
    get '/'
    assert last_response.ok?
    get '/outfit_of_the_week'
    assert last_response.ok?
    assert "outfit of the week!", last_response.body
  end

  def test_it_loads_gift_cards
    get '/'
    assert last_response.ok?
    get '/gift_cards'
    assert last_response.ok?
    assert last_response.body.include?("gift cards!")
  end

  def test_it_loads_find_us
    get '/'
    assert last_response.ok?
    get '/find_us'
    assert last_response.ok?
    assert last_response.body.include?("find us!")
  end

  def test_it_loads_blog
    get '/'
    assert last_response.ok?
    get '/blog'
    assert last_response.ok?
    assert last_response.body.include?("blog!")
  end

  def test_it_loads_mvp
    get '/'
    assert last_response.ok?
    get '/mvp_club'
    assert last_response.ok?
    assert last_response.body.include?('mvp club!')
  end

  def test_it_logs_in
    get '/login', session: {
    user:  "admin"
    }
    assert last_response.redirect?
    follow_redirect!
    assert last_response.ok?
  end

  def test_it_edits_pages
    skip
  end

  def test_it_creates_blog_post
    skip
  end

  def test_it_edits_blog_post
    skip
  end

  def test_it_deletes_blog_post
    skip
  end

end
