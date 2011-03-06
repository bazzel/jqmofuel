class AddUserIdToCars < ActiveRecord::Migration
  def self.up
    add_column :cars, :user_id, :integer
    add_index :cars, :user_id
  end

  def self.down
    remove_index :cars, :user_id
    remove_column :cars, :user_id
  end
end
