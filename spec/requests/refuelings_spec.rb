require 'spec_helper'

describe "Refuelings" do
  describe "GET /refuelings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get refuelings_path
      response.status.should be(200)
    end
  end
end
