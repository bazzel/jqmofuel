class AddFuelIdToCar < ActiveRecord::Migration
  def self.up
    add_column :cars, :fuel_id, :integer
    add_index :cars, :fuel_id
  end

  def self.down
    remove_index :cars, :fuel_id
    remove_column :cars, :fuel_id
  end
end
