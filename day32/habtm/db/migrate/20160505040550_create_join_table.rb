class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :productions, :categories do |t|
      t.index [:production_id, :category_id]
      t.index [:category_id, :production_id]
    end
  end
end
