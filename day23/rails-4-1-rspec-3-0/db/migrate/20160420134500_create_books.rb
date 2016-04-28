class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.datetime :publish_at

      t.timestamps
    end
  end
end
