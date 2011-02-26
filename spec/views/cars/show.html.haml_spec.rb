require 'spec_helper'

describe "cars/show.html.haml" do
  before(:each) do
    @car = assign(:car, stub_model(Car,
      :brand => "Brand",
      :car_model => "Car Model"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Brand/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Car Model/)
  end
end
