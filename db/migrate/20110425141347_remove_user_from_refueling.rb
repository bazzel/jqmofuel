class RemoveUserFromRefueling < ActiveRecord::Migration
  def self.up
    remove_column :refuelings, :user_id
  end

  def self.down
    add_column :refuelings, :user_id, :integer
  end
end
