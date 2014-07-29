require_relative 'feature_test_helper'

class UserUpdatesPage <FeatureTest

  #As a [User]
  #When I [Login]
  #Then i [See an edit page]
  def test_a_user_can_log_in
    visit '/login'
    assert_equal 200, page.status_code
    fill_in('user', with: 'ad')
    fill_in('password', with: 'ad')
    save_and_open_page
    click_button("Player Login")
    assert_equal 200, page.status_code
  end

  def login
    visit '/login'

  end

  #As an [Admin]
  #When I [Edit Page]
  #Then I [See updated page]

  def test_admin_can_edit
    visit '/update_who_we_are'
    assert_equal 200, page.status_code
    fill_in('title', with: 'We Are PLAYERs')
    fill_in('description', with: 'For sure for sure')
    click_button('submit')
    assert page.has_content?("We Are PLAYERs")
    assert page.has_content?('For sure for sure')
  end



  #As A [User ]
  #When I [fail login]
  #Then i [play pacman]
end
