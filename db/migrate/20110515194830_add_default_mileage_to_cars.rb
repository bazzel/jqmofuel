class AddDefaultMileageToCars < ActiveRecord::Migration
  def self.up
    say_with_time("Updating cars with mileage attribute") do
      Car.find_each do |car|
        car.update_attribute(:mileage, Mileage.find_by_unit((car.user.locale == 'nl') ? 'km' : 'mi'))
        say "#{car.id} was updated"
      end

    end
  end

  def self.down
  end
end
