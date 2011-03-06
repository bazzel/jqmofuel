class AddUserIdToRefuelings < ActiveRecord::Migration
  def self.up
    add_column :refuelings, :user_id, :integer
    add_index :refuelings, :user_id
  end

  def self.down
    remove_index :refuelings, :user_id
    remove_column :refuelings, :user_id
  end
end
