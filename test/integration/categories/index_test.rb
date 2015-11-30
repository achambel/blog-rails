require_relative 'categories_test_base'

class CategoriesTest < CategoriesTestBase

  test "list categories" do
    visit categories_path
    assert_equal categories_path, current_path
    assert page.has_text? 'Categorias'
    assert page.has_link?('Novo'), 'Link não encontrado.'
    assert page.has_link?('Mostrar'), 'Link não foi encontrado.'
    assert page.has_link?('Editar'), 'Link não foi encontrado.'
    assert page.has_link?('Remover'), 'Link não foi encontrado.'
  end

end
