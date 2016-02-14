require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:post_one)
    @category = categories(:category1)
    @user = users(:alice)
  end

  test "should get all posts" do
    get :index

    posts = assigns(:posts)

    assert_response :success
    assert_not_nil posts
    assert_equal Post.all.page, posts
  end

  test "should get all posts from a user" do
    dhh = User.create(name: 'David',
                       email: 'dhh@mail.com',
                       password: 'test',
                       password_confirmation: 'test')

    Post.create(title: "Unique post from user #{dhh.name}",
                content: 'hi',
                category: @category,
                user: dhh)

    get :index, user_id: dhh.id

    posts = assigns(:posts)

    assert_template :index
    assert_not_nil posts
    assert_equal dhh.posts.page.count, posts.count
    assert_equal dhh.posts.page, posts
  end

  test "should get all posts from a category" do
    category = Category.create(name: 'Health')
    Post.create(title: 'Unique post',
                content: 'hi',
                category: category,
                user: @user)

    get :index, category_id: category.id

    posts = assigns(:posts)

    assert_template :index
    assert_not_nil posts
    assert_equal category.posts.page.count, posts.count
    assert_equal category.posts.page, posts
  end

  test "should get new" do
    login_as(@user)

    get :new
    assert_response :success
    assert_not_nil assigns(:post)
  end

  test "should create post" do
    login_as(@user)

    assert_difference('Post.count') do
      post :create, post: {
        title: 'How to create an app rails',
        content: 'in development...',
        category_id: @category.id
      }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should edit post" do
    login_as(@user)

    get :edit, id: @post
    assert_response :success
    assert_not_nil assigns(:post)
    assert_template :edit
  end

  test "should update post" do
    login_as(@user)

    patch :update, id: @post, post: {
      title: 'How to configure docker with postgresql',
      content: 'Docker is...',
    }

    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    login_as(@user)

    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end

  test "should create a post with markdown sintax and show as html" do
    login_as(@user)
    post = Post.create(
      title: 'A post with markdown sintax',
      content: '**markdown**',
      category: @category,
      user: @user
    )
    content_html_expected = "<p><strong>markdown</strong></p>\n"

    assert_equal content_html_expected, post.content_html
  end

  test "should update a post with markdown sintax and show as html" do
    login_as(@user)
    post = Post.find(@post.id)

    post.content = '# This is an H1'
    post.save

    content_html_expected = "<h1>This is an H1</h1>\n"

    assert_equal content_html_expected, post.content_html

  end

end
