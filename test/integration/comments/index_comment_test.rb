require_relative 'comments_test_base'

class IndexCommentTest < CommentsTestBase
  test "should show comments list" do
    visit posts_path
    page.find_link(@post.title, href: post_path(@post)).click

    assert_equal(@post.comments.count, page.find('span.ui.label').text.to_i)
    assert page.find('span.user', text: /#{@post.comments.first.user.name}/)
    assert page.find('span.calendar', text: /#{I18n.l(@post.comments.first.created_at, format: :long)}/)
    assert page.find('div.segment p', text: /#{@post.comments.first.content}/)
  end
end
