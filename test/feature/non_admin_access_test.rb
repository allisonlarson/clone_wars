require_relative 'feature_test_helper'

class NonAdminAccess <FeatureTest

  def cannot_access_admin_home
    visit '/admin/update_home'
    assert_equal 200, page.status_code
    assert page.has_css?("#game")
  end

  def cannot_access_admin_dashboard
    visit '/admin/update_dashboard'
    assert_equal 200, page.status_code
    assert page.has_css?("#game")
  end

  def cannot_access_admin_who_we_are
    visit '/admin/update_who_we_are'
    assert_equal 200, page.status_code
    assert page.has_css?("#game")
  end

end
