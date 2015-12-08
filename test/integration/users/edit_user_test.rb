require_relative 'users_test_base'

class EditUserTest < UsersTestBase
  test "edit valid user" do
    visit edit_user_path(@user)

    assert page.has_text? 'Usuário'

    page.fill_in 'Nome', with: 'Kelvin'
    page.fill_in 'Quem sou eu', with: 'Outro personagem'
    page.click_button 'Atualizar Usuário'

    assert page.has_text? 'Registro atualizado com sucesso!'
  end

  test "edit invalid user" do
    visit edit_user_path(@user)

    page.fill_in 'Nome', with: ''
    page.fill_in 'Senha', with: 'abc'
    page.fill_in 'Confirmação de senha', with: 'def'
    page.click_button 'Atualizar Usuário'

    assert page.has_text? 'Por favor, verifique o(s) seguinte(s) campo(s):'
  end

  test "go to users from edit" do
    visit edit_user_path(@user)
    page.click_link 'Cancelar'

    assert_equal user_path(@user), current_path
  end

  test "confirm delete from edit" do
    Capybara.current_driver = :webkit
    visit edit_user_path(@user)

    page.accept_confirm 'Confirma esta ação?' do
      page.click_link 'Remover'
    end

    assert page.has_text? 'Registro removido com sucesso!'
    assert_equal users_path, current_path
  end

  test "dismiss delete action from edit" do
    Capybara.current_driver = :webkit
    visit edit_user_path(@user)

    page.dismiss_confirm 'Confirma esta ação?' do
      page.click_link 'Remover'
    end

    assert_equal edit_user_path(@user), current_path
  end
end
