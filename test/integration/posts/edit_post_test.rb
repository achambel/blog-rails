require_relative 'posts_test_base'

class EditPostTest < PostsTestBase

  test "edit valid post" do
    login_as(@user)

    visit edit_post_path(@post)

    page.fill_in 'Título', with: 'ActiveRecord'
    page.fill_in 'Conteúdo', with: 'ActiveRecord is better of JPA'
    page.select 'Category 1', from: 'Categoria'

    page.click_button 'Atualizar Post'

    assert page.find('div.message', text: /^Registro atualizado com sucesso!$/)
  end

  test "edit invalid post" do
    login_as(@user)

    visit edit_post_path(@post)

    page.fill_in 'Título', with: ''
    page.fill_in 'Conteúdo', with: ''

    page.click_button 'Atualizar Post'

    expected_text = "Por favor, verifique o(s) seguinte(s) campo(s):"
    assert_equal(expected_text, page.find('div.error p').text)
  end

  test "go to posts from edit" do
    login_as(@user)

    visit edit_post_path(@post)

    page.click_link 'Cancelar'

    assert_equal posts_path, current_path
  end

  test "confirm delete from edit" do
    Capybara.current_driver = :webkit
    login_as(@user)

    visit edit_post_path(@post)

    page.accept_confirm 'Confirma esta ação?' do
      page.click_link 'Remover'
    end

    assert page.has_text? 'Registro removido com sucesso!'
    assert_equal posts_path, current_path
  end

  test "dismiss delete action from edit" do
    Capybara.current_driver = :webkit

    login_as(@user)

    visit edit_post_path(@post)

    page.dismiss_confirm 'Confirma esta ação?' do
      page.click_link 'Remover'
    end

    assert_equal edit_post_path(@post), current_path
  end

  test "should be a text Post on h1" do
    login_as(@user)

    visit edit_post_path(@post)

    assert page.find('h1', text: /^Post$/)
  end
end
