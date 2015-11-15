class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :whoami
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps null: false
    end
  end
end
