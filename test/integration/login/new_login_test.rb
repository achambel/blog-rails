require 'test_helper'

class NewLoginTest < ActionDispatch::IntegrationTest
  test "valid login" do
    page.visit login_path
    assert_equal login_path, current_path

    page.fill_in 'E-mail', with: 'john.doe@mail.com'
    page.fill_in 'Senha', with: 'test'
    page.click_button 'Entrar'

    assert_equal root_path, current_path
  end
end
