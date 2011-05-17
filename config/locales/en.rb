{ :en => {
    :helpers => {
      :label => {
        :car => {
          :mileage => lambda { |key, options| "#{Car.human_attribute_name('mileage')}:" }
        },
        :refueling => {
          :date => lambda { |key, options| "#{Refueling.human_attribute_name('date')}:" }
        },
        :user => {
          :locale => lambda { |key, options| "#{User.human_attribute_name('locale')}:" },
          :volume => lambda { |key, options| "#{User.human_attribute_name('volume')}:" }
        }
      }
    }
  }
}
