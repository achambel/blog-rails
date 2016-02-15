require_relative 'users_test_base'

class IndexUserTest < UsersTestBase
  test "denied access for not authentication user" do
    visit users_path

    assert_equal login_path, current_path
  end

  test "list users" do
    login_as(@user)
    visit users_path

    assert page.has_text?('Usuários'), 'Texto Usuários não encontrado'
    %w[Novo Mostrar Editar Remover].each do |link|
      assert page.has_link?(link), "Link #{link} não encontrado"
    end
  end

  test "should show link to user_posts" do
    login_as(@user)

    visit users_path

    assert page.find('td', text: @user.name).find_link(@user.name,
                                                  href: user_posts_path(@user))
  end

end
