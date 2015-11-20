require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:category1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:category)
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, category: { name: 'Node JS', description: "It's cool, but, i prefer rails!" }
    end

    assert_equal I18n.t('views.categories.notice_saved'), flash[:notice]
    assert_redirected_to category_path(assigns(:category))
  end

  test "should update category" do
    @category.name = "Ember JS"
    @category.description = "A JS framework"

    patch :update, id: @category, category: { name: @category.name, description: @category.description }
    assert_redirected_to category_path(assigns(:category))
  end

end
