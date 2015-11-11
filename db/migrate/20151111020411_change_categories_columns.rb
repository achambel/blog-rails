class ChangeCategoriesColumns < ActiveRecord::Migration
  def change
    change_column :categories, :name, :string, limit: 50, null: false
    change_column :categories, :description, :text, limit: 255
  end
end
