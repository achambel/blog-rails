require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:post_one)
    @category = categories(:category1)
    @user = users(:alice)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:post)
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: {
        title: 'How to create an app rails',
        content: 'in development...',
        category_id: @category,
        user_id: @user
      }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should edit post" do
    get :edit, id: @post
    assert_response :success
    assert_not_nil assigns(:post)
    assert_template :edit
  end

  test "should update post" do
    patch :update, id: @post, post: {
      title: 'How to configure docker with postgresql',
      content: 'Docker is...',
    }

    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
