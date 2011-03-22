module ChartsHelper

  def moving_average_chart(car)
    refuelings = car.relevant_refuelings
    fuel_efficiency = refuelings.map(&:fuel_efficiency)
    moving_fuel_efficiency = refuelings.map(&:moving_fuel_efficiency)

    Gchart.line({
      :data => [fuel_efficiency, moving_fuel_efficiency],
      :axis_with_labels => 'y',
      :max_value        => (fuel_efficiency + moving_fuel_efficiency).max*1.05,
      :min_value        => (fuel_efficiency + moving_fuel_efficiency).min/1.05,
      :line_colors      => "F7A10A,4582E7",
      :title            => t('charts.moving_average.title', :kilometer => t('abbr.kilometer'), :liter => t('abbr.liter')),
      :legend           => t('charts.moving_average.legend'),
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
