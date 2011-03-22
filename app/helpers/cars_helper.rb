module CarsHelper

  # 1:x (L:km)
  def fuel_efficiency(car)
    if car && car.fuel_efficiency
      "1:#{number_with_precision(car.fuel_efficiency, :precision => 1)} (#{t('abbr.liter')}:#{t('abbr.kilometer')})"
    end
  end

  def refueling_ago_in_words(refueling)
    if refueling
      t('car.refueling_ago_in_words', :date => time_ago_in_words(refueling.date))
    end
  end
end
