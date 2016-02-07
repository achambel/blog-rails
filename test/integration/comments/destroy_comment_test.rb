require_relative 'comments_test_base'

class DestroyCommentTest < CommentsTestBase
  test "should remove a comment" do
    Capybara.current_driver = :webkit

    login_as(@user)
    visit post_path(@post)

    total_before = page.find('#total').text.to_i

    page.find('#comment_content').set("Alice's comment")
    page.click_button 'Comentar'

    page.find('#comments a.button', text: 'Remover').click
    page.find('.positive', text: 'Sim').trigger('click')

    total_after = page.find('#total').text.to_i

    assert page.find('div.content', text: /^Registro removido com sucesso!$/)
    assert_equal total_before, total_after

  end

end
