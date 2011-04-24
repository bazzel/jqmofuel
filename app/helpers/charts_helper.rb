module ChartsHelper

  def fuel_efficiency_chart(car)
    refuelings = car.relevant_refuelings
    fuel_efficiency = refuelings.map(&:fuel_efficiency)
    moving_fuel_efficiency = refuelings.map(&:moving_fuel_efficiency)

    Gchart.line({
      :data => [fuel_efficiency, moving_fuel_efficiency],
      :axis_with_labels => 'y',
      :max_value        => (fuel_efficiency + moving_fuel_efficiency).max*1.05,
      :min_value        => (fuel_efficiency + moving_fuel_efficiency).min/1.05,
      :line_colors      => "F7A10A,4582E7",
      :title            => t('charts.fuel_efficiency.title', :mileage => mileage_unit, :volume => volume_unit),
      :legend           => t('charts.fuel_efficiency.legend'),
      :bg               => {
        :color => 'ECECEC,0,E5E5E5,1',
        :type  => 'gradient',
        :angle => 270
      },
      :size             => '290x200',
      :format           => 'image_tag',
      :custom           => 'chg=20,-1&chdlp=b&chls=2|2' # Grid Lines (chg),
                                                        # Legend at the bottom of the chart (chdlp),
                                                        # Line Styles (chls)
    }).html_safe
  end

  def fuel_consumption_chart(car)
    refuelings = car.relevant_refuelings
    fuel_consumption = refuelings.map(&:fuel_consumption)
    moving_fuel_consumption = refuelings.map(&:moving_fuel_consumption)

    Gchart.line({
      :data => [fuel_consumption, moving_fuel_consumption],
      :axis_with_labels => 'y',
      :max_value        => (fuel_consumption + moving_fuel_consumption).max*1.05,
      :min_value        => (fuel_consumption + moving_fuel_consumption).min/1.05,
      :line_colors      => "F7A10A,4582E7",
      :title            => t('charts.fuel_consumption.title', :mileage => mileage_unit, :volume => volume_unit),
      :legend           => t('charts.fuel_consumption.legend'),
      :bg               => {
        :color => 'ECECEC,0,E5E5E5,1',
        :type  => 'gradient',
        :angle => 270
      },
      :size             => '290x200',
      :format           => 'image_tag',
      :custom           => 'chg=20,-1&chdlp=b&chls=2|2' # Grid Lines (chg),
                                                        # Legend at the bottom of the chart (chdlp),
                                                        # Line Styles (chls)
    }).html_safe
  end

  def fuel_cost_chart(car)
    refuelings = car.relevant_refuelings
    fuel_cost = refuelings.map(&:fuel_cost)
    moving_fuel_cost = refuelings.map(&:moving_fuel_cost)

    Gchart.line({
      :data => [fuel_cost, moving_fuel_cost],
      :axis_with_labels => 'y',
      :max_value        => (fuel_cost + moving_fuel_cost).max*1.05,
      :min_value        => (fuel_cost + moving_fuel_cost).min/1.05,
      :line_colors      => "F7A10A,4582E7",
      :title            => t('charts.fuel_cost.title', :mileage => mileage_unit),
      :legend           => t('charts.fuel_cost.legend'),
      :bg               => {
        :color => 'ECECEC,0,E5E5E5,1',
        :type  => 'gradient',
        :angle => 270
      },
      :size             => '290x200',
      :format           => 'image_tag',
      :custom           => 'chg=20,-1&chdlp=b&chls=2|2' # Grid Lines (chg),
                                                        # Legend at the bottom of the chart (chdlp),
                                                        # Line Styles (chls)
    }).html_safe
  end
end
