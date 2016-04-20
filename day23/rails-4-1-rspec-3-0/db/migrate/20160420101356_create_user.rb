class CreateUser < ActiveRecord::Migration
  def change
    create_table :users2 do |t|
      t.string :name
      t.string :email
    end
    add_index :users2, :email, unique: true
  end
end
