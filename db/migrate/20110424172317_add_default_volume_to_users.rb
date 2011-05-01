class AddDefaultVolumeToUsers < ActiveRecord::Migration
  def self.up
    say_with_time("Updating users with volume attribute") do
      User.all.each do |user|
        user.update_attribute(:volume, Volume.find_first_by_unit((user.locale == 'nl') ? 'l' : 'gal'))
        say "#{user.id} was updated"
      end
    end
  end

  def self.down
  end
end
