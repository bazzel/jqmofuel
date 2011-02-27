require 'spec_helper'

describe "refuelings/show.html.haml" do
  before(:each) do
    @refueling = assign(:refueling, stub_model(Refueling,
      :amount => "9.99",
      :liter => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
