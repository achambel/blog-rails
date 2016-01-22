require 'test_helper'

class EditPostTest < ActionDispatch::IntegrationTest

  setup do
    @post = posts(:post_one)
  end

  test "edit valid post" do
    visit edit_post_path(@post)

    page.fill_in 'Título', with: 'ActiveRecord'
    page.fill_in 'Conteúdo', with: 'ActiveRecord is better of JPA'
    page.select 'Category 1', from: 'Categoria'

    page.click_button 'Atualizar Post'

    assert page.find('div.message', text: /^Registro atualizado com sucesso!$/)
  end

  test "edit invalid post" do
    visit edit_post_path(@post)

    page.fill_in 'Título', with: ''
    page.fill_in 'Conteúdo', with: ''

    page.click_button 'Atualizar Post'

    expected_text = "Por favor, verifique o(s) seguinte(s) campo(s):"
    assert_equal(expected_text, page.find('div.error p').text)
  end
end
