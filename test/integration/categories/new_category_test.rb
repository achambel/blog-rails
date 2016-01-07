require_relative 'categories_test_base'

class NewCategoryTest < CategoriesTestBase

  test "denied access for not authenticated user" do
    visit new_category_path

    assert_equal login_path, current_path
  end

  test "new category from categories" do
    login_as(@user)

    visit categories_path
    page.click_link 'Novo'

    assert_equal new_category_path, current_path
  end

  test "fill valid category" do
    login_as(@user)

    visit categories_path
    page.click_link 'Novo'
    page.fill_in 'Nome', with: 'Coffee'
    page.fill_in 'Descrição', with: 'Categoria sobre café.'
    page.click_button 'Criar Categoria'

    assert page.has_text? 'Registro salvo com sucesso!'
  end

  test "fill invalid category" do
    login_as(@user)

    visit categories_path
    page.click_link 'Novo'
    page.click_button 'Criar Categoria'

    assert page.has_text? 'Por favor, verifique o(s) seguinte(s) campo(s):'
  end

  test "go to categories from new" do
    login_as(@user)

    visit new_category_path
    page.click_link 'Voltar'

    assert_equal categories_path, current_path
  end
end
