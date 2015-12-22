require_relative 'users_test_base'

class ShowUserTest < UsersTestBase

  test "denied access for not authentication user" do
    visit user_path(@user)

    assert_equal login_path, current_path
  end

  test "show user from users" do
    login_as(@user)
    visit users_path

    page.first(:link, 'Mostrar').click

    [
      'Nome',
      'Quem sou eu',
      'E-mail',
      'Criado às',
      'Atualizado às',
      'Editar',
      'Remover',
      'Voltar'
    ].each do |text|
      assert page.has_text?(text), "Texto #{text} não foi encontrado."
    end
  end
end
