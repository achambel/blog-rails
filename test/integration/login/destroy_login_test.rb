require 'test_helper'

class DestroyLoginTest < ActionDispatch::IntegrationTest
  test "should destroy current session" do
    user = users(:alice)
    login_as(user)

    click_link 'Sair'

    assert_equal login_path, current_path
  end
end
