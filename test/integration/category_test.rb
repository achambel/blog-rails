require 'test_helper'

class CategoriesTest < ActionDispatch::IntegrationTest
  test "list categories" do
    visit categories_path
    assert_equal '/categories', current_path
    assert page.has_text? I18n.t('views.categories.h1')
  end
end
