class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title
      t.text :description
      t.integer :moderator_id, index: true
      t.timestamps null: false
    end
  end
end
