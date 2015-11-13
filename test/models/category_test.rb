require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "shouldn't save category with empty name" do
     category = Category.new
     assert_not category.save
  end

  test "permit delete category and its posts" do
    category = Category.first
    category.destroy
    assert category.destroyed?
  end

  test "name shouldn't have less 3 chars" do
    category = Category.create(name: "TD", description: "Test Drive Dev")
    assert_not category.valid?
  end
end
