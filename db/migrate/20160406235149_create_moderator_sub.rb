class CreateModeratorSub < ActiveRecord::Migration
  def change
    create_table :moderator_subs do |t|
      t.integer :moderator_id, null: false, index: true
      t.integer :sub_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
