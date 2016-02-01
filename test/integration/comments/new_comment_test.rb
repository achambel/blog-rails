require_relative 'comments_test_base'

class NewCommentTest < CommentsTestBase
  test "should show login button for new comment" do
    visit post_path(@post)
    page.find_link('Entrar para comentar', href: login_path).click

    assert_equal login_path, current_path
  end

  test "should show textarea for new comment" do
    visit post_path(@post)
    page.find_link('Entrar para comentar', href: login_path).click
    login_as(@user, visit_login_path = false)

    assert_equal post_path(@post), current_path
    assert page.find('textarea.comment')
  end

  test "should create a new comment" do
    Capybara.current_driver = :webkit

    login_as(@user)
    visit post_path(@post)

    page.find('#comment_content').set('Great post!')
    page.click_button 'Comentar'

    assert page.has_selector?('div#comments > div.ui.piled.segment', count: 1)
    assert_equal '', page.find('#comment_content').text
    assert_equal @post.comments.count, page.find('span#total').text.to_i
  end

  test "should show error message for empty content" do
    Capybara.current_driver = :webkit

    login_as(@user)
    visit post_path(@post)
    total = @post.comments.count

    page.find('#comment_content').set('')
    page.click_button 'Comentar'

    assert page.has_selector?('div#comment-message > div.ui.icon.error.message', count: 1)
    assert_equal total, page.find('span#total').text.to_i

  end
end
