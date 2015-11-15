require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "requires title" do
    post = Post.create(title: nil)
    assert post.errors[:title].any?
  end

  test "title should have minimum 3 chars" do
    post = Post.create(title: 'AB')
    assert post.errors[:title].any?
  end

  test "title should have maximum 255 chars" do
    post = Post.create(title: 'A' * 256)
    assert post.errors[:title].any?
  end

  test "requires content" do
    post = Post.create(content: '')
    assert post.errors[:content].any?
  end

  test "requires category" do
    post = Post.create(category: nil)
    assert post.errors[:category].any?
  end

  test "requires user" do
    post = Post.create(user: nil)
    assert post.errors[:user].any?
  end

  test "requires valid user" do
    post = Post.create(user: User.last)
    assert post.errors[:user].empty?
  end
end
