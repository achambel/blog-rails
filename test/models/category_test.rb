require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "requires name" do
     category = Category.create(name: nil)
     assert category.errors[:name].any?
  end

  test "name should have minimum 3 chars" do
    category = Category.create(name: 'TD')
    assert category.errors[:name].any?
  end

  test "name should have maximum 50 chars" do
    category = Category.create(name: ("Ruby is cool" * 5))
    assert category.errors[:name].any?
  end

  test "destroy category and its posts" do
    category = Category.first
    category.destroy
    assert category.destroyed?
    assert_equal(0, category.posts.size)
  end

  test "should generate a slug" do
    category = Category.create(name: 'Matérias de Programação',
                               description: 'A category')
    assert_equal 'materias-de-programacao', category.slug
  end

end
