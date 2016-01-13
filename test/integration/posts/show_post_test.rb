require 'test_helper'

class ShowPostTest < ActionDispatch::IntegrationTest
  test "should show post details" do
    post = posts(:post_one)

    visit post_path(post)

    assert_equal(post_path(post), current_path)
    assert(post.title, page.find('h3', text: /^#{post.title}$/).text)
    assert(post.content, page.find('p', text: /^#{post.content}$/).text)
    assert(post.user.name, page.find('span', text: /#{post.user.name}/).text)
    assert(I18n.l(post.created_at, format: :long), page.find('span', text: /#{I18n.l(post.created_at, format: :long)}/).text)
  end
end
