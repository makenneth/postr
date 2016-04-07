class CreateVoteCounts < ActiveRecord::Migration
  def change
    create_table :vote_counts do |t|
      t.integer :vote_id, null: false, index: true
      t.integer :count, default: 0

      t.timestamps null: false
    end
  end
end
