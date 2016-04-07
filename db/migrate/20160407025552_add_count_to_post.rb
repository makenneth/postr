class AddCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :count, :integer, default: 0
    add_column :comments, :count, :integer, default: 0
  end
end
