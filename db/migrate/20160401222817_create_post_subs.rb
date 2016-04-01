class CreatePostSubs < ActiveRecord::Migration
  def change
    create_table :post_subs do |t|
      t.integer :sub_id, index: true, null:false
      t.integer :post_id, index: true, null:false
      t.timestamps null: false
    end
  end
end
