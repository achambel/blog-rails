require 'test_helper'

class PostsTestBase < ActionDispatch::IntegrationTest
  setup do
    @user = users(:alice)
    @post = posts(:post_one)
  end
end
