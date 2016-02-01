require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:comment_two)
    @user = users(:alice)
    @post = posts(:post_one)
  end

  test "should create comment" do
    login_as(@user)

    assert_difference('Comment.count') do
      post :create, post_id: @post, comment: {
        content: 'Great post John',
        post_id: @post
      }, format: :json
    end

    assert_response :ok
    binding.pry
    assert_equal assigns(:comment).to_json, @response.body
  end

  test "should destroy comment" do
    delete :destroy, post_id: @comment.post, id: @comment
    assert_redirected_to post_path(assigns(:post))
  end
end
