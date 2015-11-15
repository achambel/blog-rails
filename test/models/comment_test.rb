require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "requires content" do
    comment = Comment.create(content: nil)
    assert comment.errors[:content].any?
  end

  test "requires user" do
    comment = Comment.create(user: nil)
    assert comment.errors[:user].any?
  end

  test "requires post" do
    comment = Comment.create(post: nil)
    assert comment.errors[:post].any?
  end

end
