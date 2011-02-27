require 'spec_helper'

describe "refuelings/edit.html.haml" do
  before(:each) do
    @refueling = assign(:refueling, stub_model(Refueling,
      :amount => "9.99",
      :liter => "9.99"
    ))
  end

  it "renders the edit refueling form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => refuelings_path(@refueling), :method => "post" do
      assert_select "input#refueling_amount", :name => "refueling[amount]"
      assert_select "input#refueling_liter", :name => "refueling[liter]"
    end
  end
end
