require 'test_helper'

class UsersTestBase < ActionDispatch::IntegrationTest
  self.use_transactional_fixtures = false

  setup do
    Capybara.javascript_driver = :webkit
    @user = users(:alice)
  end

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
