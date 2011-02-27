require 'spec_helper'

describe "refuelings/index.html.haml" do
  before(:each) do
    assign(:refuelings, [
      stub_model(Refueling,
        :amount => "9.99",
        :liter => "9.99"
      ),
      stub_model(Refueling,
        :amount => "9.99",
        :liter => "9.99"
      )
    ])
  end

  it "renders a list of refuelings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
