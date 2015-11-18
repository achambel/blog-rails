require 'test_helper'

class CategoriesTest < ActionDispatch::IntegrationTest
  test "list categories" do
    visit categories_path
    assert_equal '/categories', current_path
    assert page.has_text? I18n.t('views.categories.h1')
  end

  test "show category" do
    visit categories_path
    click_link('show')
    assert /\/categories\/\d/ =~ current_path,
              "Actual: #{current_path}\nExpected: /categories/:id"

  end
end
