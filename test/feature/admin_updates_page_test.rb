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

  def test_admin_can_upload_home_photos
    login
    visit '/admin/update_home'
    assert_equal 200, page.status_code
    #code that uploads photos here
  end

  def test_admin_can_view_edit_1_page
    login
    visit '/admin/edit/1'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 2, :visible => "true")
    assert page.has_button?("Save Front View")
  end

  def test_admin_can_edit_1
    login
    visit '/admin/edit/1'
    fill_in('title', with: 'We Are PLAYERs')
    fill_in('description', with: 'For sure for sure')
    # must setup phony DB
    # if we dont, it breaks all the things
    # click_button('submit')
    # assert page.has_content?("We Are PLAYERs")
    # assert page.has_content?('For sure for sure')
  end

  def test_admin_can_view_edit_2_page
    login
    visit '/admin/edit/2'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 2, :visible => "true")
    assert page.has_button?("Save Front View")
  end

  def test_admin_can_edit_2
    login
    visit '/admin/edit/2'
    fill_in('title', with: 'We Are PLAYERs')
    fill_in('description', with: 'For sure for sure')
    # must setup phony DB
    # if we dont, it breaks all the things
    # click_button('submit')
    # assert page.has_content?("We Are PLAYERs")
    # assert page.has_content?('For sure for sure')
  end

  def test_admin_can_view_edit_3_page
    login
    visit '/admin/edit/3'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 2, :visible => "true")
    assert page.has_button?("Save Front View")
  end

  def test_admin_can_edit_3
    login
    visit '/admin/edit/3'
    fill_in('title', with: 'We Are PLAYERs')
    fill_in('description', with: 'For sure for sure')
    # must setup phony DB
    # if we dont, it breaks all the things
    # click_button('submit')
    # assert page.has_content?("We Are PLAYERs")
    # assert page.has_content?('For sure for sure')
  end

  def test_admin_can_view_edit_4_page
    login
    visit '/admin/edit/4'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 2, :visible => "true")
    assert page.has_button?("Save Front View")
  end
    def test_admin_can_edit_4
    login
    visit '/admin/edit/4'
    fill_in('title', with: 'We Are PLAYERs')
    fill_in('description', with: 'For sure for sure')
    # must setup phony DB
    # if we dont, it breaks all the things
    # click_button('submit')
    # assert page.has_content?("We Are PLAYERs")
    # assert page.has_content?('For sure for sure')
  end

  def test_admin_can_view_edit_5_page
    login
    visit '/admin/edit/5'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 2, :visible => "true")
    assert page.has_button?("Save Front View")
  end

  def test_admin_can_edit_2
    login
    visit '/admin/edit/5'
    fill_in('title', with: 'We Are PLAYERs')
    fill_in('description', with: 'For sure for sure')
    # must setup phony DB
    # if we dont, it breaks all the things
    # click_button('submit')
    # assert page.has_content?("We Are PLAYERs")
    # assert page.has_content?('For sure for sure')
  end

  #As A [User ]
  #When I [fail login]
  #Then i [play pacman]
end
