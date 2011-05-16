class MoveMileageFromUserToCar < ActiveRecord::Migration
  def self.up
    remove_index(:users, :mileage_id)
    remove_column(:users, :mileage_id)

    add_column(:cars, :mileage_id, :integer)
    add_index(:cars, :mileage_id)
  end

  def self.down
    remove_index(:cars, :mileage_id)
    remove_column(:cars, :mileage_id)

    add_column(:users, :mileage_id, :integer)
    add_index(:users, :mileage_id)
  end
end
