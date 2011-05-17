require 'spec_helper'

describe ChartsHelper do
  before(:each) do
    @current_user = mock_model(User)
    controller.stub(:current_user).and_return(@current_user)

    @mileage = mock_model(Mileage, :unit => 'km', :name => 'kilometer')
    @volume = mock_model(Volume, :unit => 'L', :name => 'litre')

    @current_user.stub(:volume).and_return(@volume)
  end

  describe "fuel_efficiency_chart" do
    before(:each) do
      refuelings = [mock_model(Refueling, :fuel_efficiency => 100, :moving_fuel_efficiency => 80)]
      @car = mock_model(Car, :relevant_refuelings => refuelings)
      @car.stub(:mileage).and_return(@mileage)
    end

    it "should generate chart with severval parameters" do
      gchart = ""
      Gchart.should_receive(:line).with(hash_including({
        :data             => [[100], [80]],
        :axis_with_labels => 'y',
        :max_value        => 100*1.05,
        :min_value        => 80/1.05,
        :line_colors      => "F7A10A,4582E7",
        :title            => "Fuel efficiency (km/L)",
        :legend           => ["Fuel efficiency", "Moving fuel efficiency"],
        :bg               => {
          :color => "ECECEC,0,E5E5E5,1",
          :type  => "gradient",
          :angle => 270
        },
        :size             => '290x200',
        :format           => 'image_tag',
        :custom           => 'chg=20,-1&chdlp=b&chls=2|2'
      })).and_return(gchart)
      gchart.should_receive(:html_safe)

      helper.fuel_efficiency_chart(@car)
    end
  end

  describe "fuel_consumption_chart" do
    before(:each) do
      refuelings = [mock_model(Refueling, :fuel_consumption => 100, :moving_fuel_consumption => 80)]
      @car = mock_model(Car, :relevant_refuelings => refuelings)
      @car.stub(:mileage).and_return(@mileage)
    end

    it "should generate chart with severval parameters" do
      gchart = ""
      Gchart.should_receive(:line).with(hash_including({
        :data             => [[100], [80]],
        :axis_with_labels => 'y',
        :max_value        => 100*1.05,
        :min_value        => 80/1.05,
        :line_colors      => "F7A10A,4582E7",
        :title            => "Fuel consumption (L/100 km)",
        :legend           => ["Fuel consumption", "Moving fuel consumption"],
        :bg               => {
          :color => "ECECEC,0,E5E5E5,1",
          :type  => "gradient",
          :angle => 270
        },
        :size             => '290x200',
        :format           => 'image_tag',
        :custom           => 'chg=20,-1&chdlp=b&chls=2|2'
      })).and_return(gchart)
      gchart.should_receive(:html_safe)

      helper.fuel_consumption_chart(@car)
    end
  end

  describe "fuel_cost_chart" do
    before(:each) do
      refuelings = [mock_model(Refueling, :fuel_cost => 100, :moving_fuel_cost => 80)]
      @car = mock_model(Car, :relevant_refuelings => refuelings)
      @car.stub(:mileage).and_return(@mileage)
    end

    it "should generate chart with severval parameters" do
      gchart = ""
      Gchart.should_receive(:line).with(hash_including({
        :data             => [[100], [80]],
        :axis_with_labels => 'y',
        :max_value        => 100*1.05,
        :min_value        => 80/1.05,
        :line_colors      => "F7A10A,4582E7",
        :title            => "Fuel cost (c/km)",
        :legend           => ["Fuel cost", "Moving fuel cost"],
        :bg               => {
          :color => "ECECEC,0,E5E5E5,1",
          :type  => "gradient",
          :angle => 270
        },
        :size             => '290x200',
        :format           => 'image_tag',
        :custom           => 'chg=20,-1&chdlp=b&chls=2|2'
      })).and_return(gchart)
      gchart.should_receive(:html_safe)

      helper.fuel_cost_chart(@car)
    end
  end

end
