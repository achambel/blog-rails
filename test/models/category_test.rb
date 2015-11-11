require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "shouldn't save category with empty name" do
     category = Category.new
     assert_not category.save
  end

  test "shouldn't delete category has posts" do
    category = Category.first
    assert_raises ActiveRecord::DeleteRestrictionError do
      category.destroy
    end
  end
end
