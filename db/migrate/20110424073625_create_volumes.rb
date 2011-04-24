class CreateVolumes < ActiveRecord::Migration
  def self.up
    create_table :volumes do |t|
      t.string :unit
      t.string :name

      t.timestamps
    end

    Volume.create_translation_table! :unit => :string, :name => :string
  end

  def self.down
    drop_table :volumes
    Volume.drop_translation_table!
  end
end
