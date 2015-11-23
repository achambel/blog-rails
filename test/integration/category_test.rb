require 'test_helper'

class CategoriesTest < ActionDispatch::IntegrationTest
  test "list categories" do
    visit categories_path
    assert_equal categories_path, current_path
    assert first('h1').has_text? 'Categorias'
  end

  test "show category" do
    visit categories_path
    first('a.show').click
    assert /\/categories\/\d/ =~ current_path,
              "Actual: #{current_path}\nExpected: /categories/:id"
  end
end
