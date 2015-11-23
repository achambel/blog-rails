require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:comment_two)
    @user = users(:alice)
    @post = posts(:post_one)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, post_id: @post, comment: {
        content: 'Great post John',
        user_id: @user,
        post_id: @post
      }
    end

    assert_redirected_to post_path(@post)
  end

  test "should update comment" do
    # /posts/:post_id/comments/:id
    patch :update, post_id: @comment.post, id: @comment, comment: {
      content: 'Amazing post John!'
    }

    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy comment" do
    delete :destroy, post_id: @comment.post, id: @comment
    assert_redirected_to post_path(assigns(:post))
  end
end
