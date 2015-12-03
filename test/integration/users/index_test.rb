require_relative 'users_test_base'

class IndexTest < UsersTestBase
  test "list users" do
    visit users_path

    assert page.has_text?('Usuários'), 'Texto Usuários não encontrado'
    %w[Novo Mostrar Editar Remover].each do |link|
      assert page.has_link?(link), "Link #{link} não encontrado"
    end
  end

end
