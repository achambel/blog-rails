require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post should has a title" do
    post = Post.new
    post.title = nil
    assert_not post.valid?
  end
end
