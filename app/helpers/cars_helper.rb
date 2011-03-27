module CarsHelper

  # 1:x (L:km)
  def fuel_efficiency(car)
    if car && car.fuel_efficiency
      "1:#{number_with_precision(car.fuel_efficiency, :precision => 1)} (#{t('abbr.liter')}:#{t('abbr.kilometer')})"
    end
  end

  def fuel_consumption(car)
    if car && car.fuel_consumption
      "#{number_with_precision(car.fuel_consumption, :precision => 1)} (#{t('abbr.liter')}/100 #{t('abbr.kilometer')})"
    end
  end

  def fuel_cost(car)
    if car && car.fuel_cost
      "#{number_with_precision(car.fuel_cost, :precision => 1)} #{t('abbr.cent')}/#{t('abbr.liter')}"
    end
  end


  def refueling_ago_in_words(refueling)
    if refueling
      t('car.refueling_ago_in_words', :date => distance_of_time_in_words(Date.today, refueling.date))
    end
  end
end
