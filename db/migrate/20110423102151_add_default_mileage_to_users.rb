class AddDefaultMileageToUsers < ActiveRecord::Migration
  def self.up
    User.all.each do |user|
      user.update_attribute(:mileage, Mileage.find_by_unit((user.locale == 'nl') ? 'km' : 'mi'))
    end
  end

  def self.down
  end
end
