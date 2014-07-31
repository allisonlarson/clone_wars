require_relative 'feature_test_helper'

class NonAdminAccess <FeatureTest

  def test_cannot_access_admin_home
    visit '/admin/update_home'
    assert_equal 200, page.status_code
    assert page.has_css?("#game")
  end

  def test_cannot_access_admin_dashboard
    visit '/admin/update_dashboard'
    assert_equal 200, page.status_code
    assert page.has_css?("#game")
  end

  def test_cannot_access_update_schedule
    visit '/admin/update_schedule'
    assert_equal 200, page.status_code
    assert page.has_css?("#game")
  end

  def test_cannot_access_outfit_of_the_week
    visit '/admin/update_outfit_of_the_week'
    assert_equal 200, page.status_code
    assert page.has_css?("#game")
  end
  
end
