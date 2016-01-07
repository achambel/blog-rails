require 'test_helper'

class UsersTestBase < ActionDispatch::IntegrationTest
  setup do
    @user = users(:alice)
  end
end
