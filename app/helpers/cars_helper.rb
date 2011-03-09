module CarsHelper

  # 1:x (L:km)
  def fuel_consumption(car)
    if car && car.fuel_consumption
      "1:#{car.fuel_consumption} (#{t('abbr.liter')}:#{t('abbr.kilometer')})"
    end
  end

  def last_refueling_in_words(car)
    if car && car.last_refueling
      t('car.last_refueling_in_words', :date => time_ago_in_words(car.last_refueling.date))
    end
  end
end
