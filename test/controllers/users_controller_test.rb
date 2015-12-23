require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:john)
    login_as(@user)
  end

  teardown do
    logout
  end

  test "should get index" do
    get :index

    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {
        name: 'Peter',
        whoami: 'I am a programmer...',
        email: 'peter@example.org',
        password: 'test',
        password_confirmation: 'test'
      }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should update user" do
    patch :update, id: @user, user: {
      name: 'Alan',
      whoami: 'I am a dba...',
      email: 'alan@example.com',
      password: 'bla',
      password_confirmation: 'bla'
    }

    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    another_user = users(:alice)

    assert_difference('User.count', -1) do
      delete :destroy, id: another_user
    end

    assert_redirected_to users_path
  end

  test "should denied logged user destroy yourself" do
    request.env["HTTP_REFERER"] = edit_user_path(@user)

    assert_difference('User.count', 0) do
      delete :destroy, id: @user
    end

    assert_redirected_to edit_user_path(@user)
  end

end
