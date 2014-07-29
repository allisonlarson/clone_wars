require_relative './feature_test_helper'

class AdminUpdatesPage <FeatureTest

  def test_user_can_see_login
    visit '/login'
    assert_equal 200, page.status_code
    assert page.has_css?("#admin-username")
    assert page.has_css?("#admin-password")
    assert page.has_button?("Player Login")
  end

  #As a [User]
  #When I [Login]
  #Then i [See an edit page]

  def test_a_user_can_log_in
    visit '/login'
    assert_equal 200, page.status_code
    fill_in('user', with: 'ad')
    fill_in('password', with: 'ad')
    click_button("Player Login")
  end

  def login
    visit '/login'
    assert_equal 200, page.status_code
    fill_in('user', with: 'ad')
    fill_in('password', with: 'ad')
    click_button("Player Login")
  end

  #As an [Admin]
  #When I [Edit Page]
  #Then I [See updated page]

  def test_admin_can_view_update_home
    login
    visit '/admin/update_home'
    assert_equal 200, page.status_code
    assert page.has_css?("#picture-button1")
    assert page.has_css?("#picture-button2")
    assert page.has_css?("#picture-button3")
  end

  def test_admin_can_edit_update_home
    # fill_in('title', with: 'We Are PLAYERs')
    # fill_in('description', with: 'For sure for sure')
    # click_button('submit')
    # assert page.has_content?("We Are PLAYERs")
    # assert page.has_content?('For sure for sure')
  end


  #As A [User ]
  #When I [fail login]
  #Then i [play pacman]
end
