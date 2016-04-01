class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :content
      t.integer :sub_id, index: true
      t.integer :author_id, index: true

      t.timestamps null: false
    end
  end
end
