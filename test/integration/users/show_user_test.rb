require_relative 'users_test_base'

class ShowUserTest < UsersTestBase
  test "show user from users" do
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
