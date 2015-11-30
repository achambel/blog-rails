require 'test_helper'

class CategoriesTestBase < ActionDispatch::IntegrationTest
  self.use_transactional_fixtures = false

  setup do
    Capybara.javascript_driver = :webkit
    @category = categories(:category1)
  end

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
