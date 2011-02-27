class CreateRefuelings < ActiveRecord::Migration
  def self.up
    create_table :refuelings do |t|
      t.datetime :date
      t.decimal :amount, :precision => 8, :scale => 2
      t.decimal :liter, :precision => 8, :scale => 2
      t.integer :mileage
      t.references :car

      t.timestamps
    end
  end

  def self.down
    drop_table :refuelings
  end
end
