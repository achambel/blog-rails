require_relative 'posts_test_base'

class NewPostTest < PostsTestBase

  test "denied access for not authenticated user" do
    visit new_post_path

    assert_equal login_path, current_path
  end

  test "new post from posts" do
    login_as(@user)

    visit posts_path
    page.click_link 'Novo'

    assert_equal new_post_path, current_path
  end

  test "fill valid post" do
    login_as(@user)

    visit posts_path
    page.click_link 'Novo'
    page.fill_in 'Título', with: 'Ice cream'
    page.fill_in 'Conteúdo', with: 'I like ice cream!'
    page.select 'Category 1', from: 'Categoria'

    page.click_button 'Criar Post'

    assert page.find('div.message', text: /^Registro salvo com sucesso!$/)
  end

  test "fill invalid post" do
    login_as(@user)

    visit posts_path
    page.click_link 'Novo'
    page.click_button 'Criar Post'

    expected_text = "Por favor, verifique o(s) seguinte(s) campo(s):"
    assert_equal(expected_text, page.find('div.error p').text)
  end

  test "go to posts from new" do
    login_as(@user)

    visit new_post_path
    page.click_link 'Cancelar'

    assert_equal posts_path, current_path
  end
end
