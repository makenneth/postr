class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id, index: true, null: false
      t.string :commentable_type, null: false
      t.integer :author_id, index: true, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
