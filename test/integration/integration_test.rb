require_relative 'integration_test_helper'
require 'pry'
class IntegrationTest < IntegrateTest

  def test_it_loads_who_we_are
    get '/'
    assert last_response.ok?, "you aren't oooook index"
    get '/who_we_are'
    assert last_response.ok?, "you aren't oooook who we are"
    assert last_response.body.include?("who we are!"), "body is not bangin'"
  end

  def test_it_loads_what_we_carry
    get '/'
    assert last_response.ok?, "you aren't oooook index"
    get '/what_we_carry'
    assert last_response.ok?, "you aren't oooook what we carry"
    assert last_response.body.include?("what we carry!"),"body is not bangin'"
  end

  def test_it_loads_what_we_do
    get '/'
    assert last_response.ok?, "you aren't oooook index"
    get '/what_we_do'
    assert last_response.ok?, "you aren't oooook what we do"
    assert last_response.body.include?("what we do!"),"body is not bangin'"
  end

  def test_it_loads_outfit_of_the_week
    get '/'
    assert last_response.ok?, "you aren't oooook index"
    get '/outfit_of_the_week'
    assert last_response.ok?, "you aren't oooook outfit of the week"
    assert last_response.body.include?("outfit of the week!"), "body is not bangin'"
  end

  def test_it_loads_gift_cards
    get '/'
    assert last_response.ok?, "you aren't oooook index"
    get '/gift_cards'
    assert last_response.ok?, "you aren't oooook gift cards"
    assert last_response.body.include?("gift cards!"),"body is not bangin'"
  end

  def test_it_loads_find_us
    get '/'
    assert last_response.ok?, "you aren't oooook index"
    get '/find_us'
    assert last_response.ok?, "you aren't oooook find us"
    assert last_response.body.include?("find us!"),"body is not bangin'"
  end

  def test_it_loads_blog
    get '/'
    assert last_response.ok?, "you aren't oooook index"
    get '/blog'
    assert last_response.ok?, "you aren't oooook blog"
    assert last_response.body.include?("blog!"),"body is not bangin'"
  end

  def test_it_loads_mvp
    get '/'
    assert last_response.ok?, "you aren't oooook index"
    get '/mvp_club'
    assert last_response.ok?, "you aren't oooook mvp club"
    assert last_response.body.include?('mvp club!'),"body is not bangin'"
  end

  def test_it_logs_in
    post '/login', user: 'ad', password: 'ad'
    assert last_response.redirect?, "you aren't redirecting"
    follow_redirect!
    assert last_response.ok?, "you aren't oooook"
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
