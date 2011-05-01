class AddMissingIndices < ActiveRecord::Migration
  def self.up
    add_index :refuelings, :car_id
    add_index :users, :mileage_id
    add_index :users, :volume_id
  end

  def self.down
    remove_index :users, :volume_id
    remove_index :users, :mileage_id
    remove_index :refuelings, :car_id
  end
end
