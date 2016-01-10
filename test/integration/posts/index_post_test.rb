require 'test_helper'

class IndexPostTest < ActionDispatch::IntegrationTest
  test "list posts" do
    posts_list = [posts(:post_one), posts(:post_two)]
    visit root_path

    posts_list.each do |post|
      assert_equal(post.title, page.find('a', text: /^#{post.title}$/).text)
    end

  end

  test "go to post path from click on title link" do
    visit root_path
    post = Post.first

    assert page.has_link?(post.title, href: post_path(post)),
          "Link #{post.title} não encontrado"

    page.click_link(post.title)

    assert_equal post_path(post), current_path
  end
end
