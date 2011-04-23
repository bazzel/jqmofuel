class CreateFuels < ActiveRecord::Migration
  def self.up
    create_table :fuels do |t|
      t.string :name

      t.timestamps
    end

    Fuel.create_translation_table! :name => :string
  end

  def self.down
    drop_table :fuels
    Fuel.drop_translation_table!
  end
end
