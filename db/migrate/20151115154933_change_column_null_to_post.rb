class ChangeColumnNullToPost < ActiveRecord::Migration
  def change
    change_column_null :posts, :user_id, false
  end
end
