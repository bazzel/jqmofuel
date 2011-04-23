class AddMileageToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :mileage_id, :integer
  end

  def self.down
    remove_column :users, :mileage_id
  end
end
