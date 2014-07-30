require_relative './feature_test_helper'

class AdminUpdatesPage <FeatureTest

  def test_user_can_see_login
    visit '/login'
    assert_equal 200, page.status_code
    assert page.has_css?("#admin-username")
    assert page.has_css?("#admin-password")
    assert page.has_button?("Player Login")
  end

  def test_admin_can_log_in
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

  def test_admin_can_view_admin_who_we_are
    login
    visit '/admin/edit/1'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 2, :visible => "true")
    assert page.has_button?("Save Front View")
  end

  def test_admin_can_edit_who_we_are
    login
    visit '/admin/edit/1'
    fill_in('title', with: 'We Are PLAYERs')
    fill_in('description', with: 'For sure for sure')
    click_on('Save Front View')
    assert page.has_content?('Wellcome player')
    visit '/who_we_are'
    assert page.has_content?("We Are PLAYERs")
    assert page.has_content?('For sure for sure')
  end

  def test_admin_can_view_edit_what_we_carry
    login
    visit '/admin/edit/2'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 2, :visible => "true")
    assert page.has_button?("Save Front View")
  end

  def test_admin_can_edit_what_we_carry
    login
    visit '/admin/edit/2'
    fill_in('title', with: 'THIS IS')
    fill_in('description', with: 'WHAT WE CARRY')
    click_on('Save Front View')
    visit '/what_we_carry'
    assert page.has_content?("THIS IS")
    assert page.has_content?('WHAT WE CARRY')
  end

  def test_admin_can_edit_what_we_do
    login
    visit '/admin/edit/3'
    fill_in('title', with: 'WE DO')
    fill_in('description', with: 'STUFF')
    click_on('Save Front View')
    visit '/what_we_do'
    assert page.has_content?('WE DO')
    assert page.has_content?('STUFF')
  end

  def test_admin_can_view_gift_cards
    login
    visit '/admin/edit/4'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 2, :visible => "true")
    assert page.has_button?("Save Front View")
  end

  def test_admin_can_edit_gift_cards
    login
    visit '/admin/edit/4'
    fill_in('title', with: 'BUY THEM')
    fill_in('description', with: 'THEY ARE GIFT CARDS')
    click_on('Save Front View')
    visit '/gift_cards'
    assert page.has_content?("BUY THEM")
    assert page.has_content?('THEY ARE GIFT CARDS')
  end

  def test_admin_can_view_edit_find_us
    login
    visit '/admin/edit/5'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 2, :visible => "true")
    assert page.has_button?("Save Front View")
  end

  def test_admin_can_edit_find_us
    login
    visit '/admin/edit/5'
    fill_in('title', with: 'THIS IS')
    fill_in('description', with: 'WHERE WE AT')
    click_on('Save Front View')
    visit '/find_us'
    assert page.has_content?("THIS IS")
    assert page.has_content?('WHERE WE AT')
  end

  def test_admin_can_view_update_schedule
    login
    visit '/admin/update_schedule'
    assert has_css?("#schedule-input")
    assert has_button?("Update Schedule")
  end

  def test_admin_can_edit_schedule
    login
    visit '/admin/update_schedule'
    fill_in('Schedule', with: '24-7 yo')
    click_on('Update Schedule')
    assert has_content?('Wellcome player'), 'NO WELLCOME'
    assert has_content?('24-7 yo'), 'NO TIME'
  end

  def test_admin_can_view_update_outfit_of_the_week
    login
    visit '/admin/update_outfit_of_the_week'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 3, :visible => true)
    assert page.has_css?("#update-date")
    assert page.has_css?("#file-upload")
    assert page.has_button?("Upload Outfit")
  end

  def test_admin_can_edit_outfit_of_the_week
    login
    visit '/admin/update_outfit_of_the_week'
    fill_in('date', :with => '1999')
    page.find("#file-upload").click
    #uploads file
    #asserts file has been uploaded and date is '1999'
  end

  def test_admin_can_view_blog
    login
    visit '/admin/update_blog'
    assert_equal 200, page.status_code
    assert page.has_css?("input", :count => 4, :visible => true)
    assert page.has_css?("#blog-author")
    assert page.has_css?("#blog-date")
    assert page.has_css?("#blog-headline")
    assert page.has_button?("Update Blog")
  end

  def test_admin_can_edit_blog
    login
    visit 'admin/update_blog'
    #fill in stuff
    #click submit
    #verify stuff
    #clear db
  end

end
