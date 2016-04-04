class AddSubIdsToUser < ActiveRecord::Migration
  def change
    add_column :users, :sub_ids, :integer, null: false
  end
end
