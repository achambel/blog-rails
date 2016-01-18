require 'test_helper'

class ShowPostTest < ActionDispatch::IntegrationTest

  setup do
    @post = posts(:post_one)
  end

  test "should show post details" do

    visit post_path(@post)

    assert_equal post_path(@post), current_path
    assert page.find('h3', text: /^#{@post.title}$/)
    assert page.find('p', text: /^#{@post.content}$/)
    assert page.find('span', text: /#{@post.user.name}/)
    assert page.find('span', text: /#{I18n.l(@post.created_at, format: :long)}/)
  end

  test "go back from show post" do
    visit post_path(@post)
    page.click_link('Voltar')

    assert_equal(posts_path, current_path)
  end

  test "go to edit page from show" do
    visit post_path(@post)
    page.click_link('Editar')

    assert_equal(edit_post_path(@post), current_path)
  end

  test "confirm delete from show" do
    Capybara.current_driver = :webkit

    visit post_path(@post)

    page.accept_confirm 'Confirma esta ação?' do
      page.click_link 'Remover'
    end

    assert page.find('div.content', text: /^Registro removido com sucesso!$/)
    assert_equal posts_path, current_path
  end

  test "dismiss delete action from show" do
    Capybara.current_driver = :webkit

    visit post_path(@post)

    page.dismiss_confirm 'Confirma esta ação?' do
      page.click_link 'Remover'
    end

    assert_equal post_path(@post), current_path
  end
end