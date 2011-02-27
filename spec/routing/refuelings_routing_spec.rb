require "spec_helper"

describe RefuelingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/refuelings" }.should route_to(:controller => "refuelings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/refuelings/new" }.should route_to(:controller => "refuelings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/refuelings/1" }.should route_to(:controller => "refuelings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/refuelings/1/edit" }.should route_to(:controller => "refuelings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/refuelings" }.should route_to(:controller => "refuelings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/refuelings/1" }.should route_to(:controller => "refuelings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/refuelings/1" }.should route_to(:controller => "refuelings", :action => "destroy", :id => "1")
    end

  end
end
