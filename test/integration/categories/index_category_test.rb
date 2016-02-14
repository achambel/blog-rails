require_relative 'categories_test_base'

class IndexCategoryTest < CategoriesTestBase
  test "denied access for not authenticated user" do
    visit categories_path

    assert_equal login_path, current_path
  end

  test "list categories" do
    login_as(@user)

    visit categories_path

    assert page.has_text? 'Categorias'
    %w[Novo Mostrar Editar Remover].each do |link|
      assert page.has_link?(link), "Link #{link} não encontrado"
    end
  end

  test "should show link to category_posts" do
    login_as(@user)
    visit categories_path

    assert page.first('td').find_link(
      @category.name,
      href: category_posts_path(@category)
    )
  end

end
