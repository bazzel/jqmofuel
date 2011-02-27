require 'spec_helper'

describe "refuelings/new.html.haml" do
  before(:each) do
    assign(:refueling, stub_model(Refueling,
      :amount => "9.99",
      :liter => "9.99"
    ).as_new_record)
  end

  it "renders new refueling form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => refuelings_path, :method => "post" do
      assert_select "input#refueling_amount", :name => "refueling[amount]"
      assert_select "input#refueling_liter", :name => "refueling[liter]"
    end
  end
end
