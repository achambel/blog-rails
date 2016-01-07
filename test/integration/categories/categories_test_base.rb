require 'test_helper'

class CategoriesTestBase < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:category1)
    @user = users(:john)
  end
end
