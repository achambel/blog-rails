require_relative 'comments_test_base'

class IndexCommentTest < CommentsTestBase
  test "should show comments list" do
    visit posts_path
    page.find_link(@post.title, href: post_path(@post)).click

    assert_equal(@post.comments.count, page.find('h5 span.ui.label').text.to_i)
    assert page.find('h4 span.user', text: /#{@post.comments.first.user.name}/)
    assert page.find('h4 span.calendar', text: /#{I18n.l(@post.comments.first.created_at, format: :long)}/)
    assert page.find('.piled.segment p', text: /#{@post.comments.first.content}/)
  end
end
