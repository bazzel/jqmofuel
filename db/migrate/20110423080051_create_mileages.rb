class CreateMileages < ActiveRecord::Migration
  def self.up
    create_table :mileages do |t|
      t.string :name
      t.string :unit

      t.timestamps
    end

    Mileage.create_translation_table! :name => :string

  end

  def self.down
    drop_table :mileages
    Mileage.drop_translation_table!
  end
end
