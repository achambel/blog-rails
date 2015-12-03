require_relative 'categories_test_base'

class CategoriesTest < CategoriesTestBase

  test "list categories" do
    visit categories_path

    assert page.has_text? 'Categorias'
    %w[Novo Mostrar Editar Remover].each do |link|
      assert page.has_link?(link), "Link #{link} não encontrado"
    end
  end

end
