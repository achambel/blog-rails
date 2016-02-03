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
    assert_equal assigns(:comment).to_json, @response.body
  end

  test "should destroy comment" do
    delete :destroy, post_id: @comment.post, id: @comment
    assert_redirected_to post_path(assigns(:post))
  end

  test "not allow the user destroy user comments B" do
    category1 = categories(:category1)

    alice = users(:alice)
    login_as(alice)
    alice_post = Post.create(title: "Alice's post", content:'A post',
                              category: category1, user: alice)

    alice_comment = Comment.create(content: "A comment from alice.",
                                    user: alice, post: alice_post)
    logout

    assert_no_difference('Comment.count') do
      john = users(:john)
      login_as(john)

      delete :destroy, post_id: alice_post, id: alice_comment
    end

  end
end
