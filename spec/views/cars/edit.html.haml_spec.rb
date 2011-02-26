require 'spec_helper'

describe "cars/edit.html.haml" do
  before(:each) do
    @car = assign(:car, stub_model(Car,
      :brand => "MyString",
      :car_model => "MyString"
    ))
  end

  it "renders the edit car form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cars_path(@car), :method => "post" do
      assert_select "input#car_brand", :name => "car[brand]"
      assert_select "input#car_car_model", :name => "car[car_model]"
    end
  end
end
