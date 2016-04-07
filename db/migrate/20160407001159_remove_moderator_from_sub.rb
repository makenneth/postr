class RemoveModeratorFromSub < ActiveRecord::Migration
  def change
    remove_column :subs, :moderator_id, :integer
  end
end
