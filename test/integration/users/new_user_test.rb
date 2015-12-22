require_relative 'users_test_base'

class NewUserTest < UsersTestBase
  test "denied access for not authentication user" do
    visit new_user_path

    assert_equal login_path, current_path
  end

  test "new user from users" do
    login_as(@user)

    visit users_path
    page.click_link 'Novo'

    assert_equal new_user_path, current_path
  end

  test "fill valid user" do
    login_as(@user)

    visit users_path
    page.click_link 'Novo'

    page.fill_in 'Nome', with: 'Brian Lux'
    page.fill_in 'Quem sou eu', with: 'Um segundo personagem'
    page.fill_in 'E-mail', with: 'brian.lux@example.org'
    page.fill_in 'Senha', with: 'tes1'
    page.fill_in 'Confirmação de senha', with: 'tes1'
    page.click_button 'Criar Usuário'

    assert page.has_text? 'Registro salvo com sucesso!'
  end

  test "fill invalid user" do
    login_as(@user)
    visit users_path
    page.click_link 'Novo'

    page.click_button 'Criar Usuário'

    assert page.has_text? 'Por favor, verifique o(s) seguinte(s) campo(s):'
  end

  test "go to users from new" do
    login_as(@user)
    visit new_user_path
    page.click_link 'Voltar'

    assert_equal users_path, current_path
  end
end
