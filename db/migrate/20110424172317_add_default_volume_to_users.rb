class AddDefaultVolumeToUsers < ActiveRecord::Migration
  def self.up
    User.all.each do |user|
      user.update_attribute(:volume, Volume.find_first_by_unit((user.locale == 'nl') ? 'l' : 'gal'))
    end
  end

  def self.down
  end
end
