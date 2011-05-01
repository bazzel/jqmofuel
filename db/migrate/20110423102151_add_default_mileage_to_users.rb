class AddDefaultMileageToUsers < ActiveRecord::Migration
  def self.up
    say_with_time("Updating users with mileage attribute") do
      User.find_each do |user|
        user.update_attribute(:mileage, Mileage.find_by_unit((user.locale == 'nl') ? 'km' : 'mi'))
        say "#{user.id} was updated"
      end

    end

  end

  def self.down
  end
end
