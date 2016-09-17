class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :cost
      t.integer :openspots
      t.boolean :approval
      t.timestamps null: false
    end
  end
end
