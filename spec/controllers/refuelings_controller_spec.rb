require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe RefuelingsController do

  def mock_refueling(stubs={})
    @mock_refueling ||= mock_model(Refueling, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all refuelings as @refuelings" do
      Refueling.stub(:all) { [mock_refueling] }
      get :index
      assigns(:refuelings).should eq([mock_refueling])
    end
  end

  describe "GET show" do
    it "assigns the requested refueling as @refueling" do
      Refueling.stub(:find).with("37") { mock_refueling }
      get :show, :id => "37"
      assigns(:refueling).should be(mock_refueling)
    end
  end

  describe "GET new" do
    it "assigns a new refueling as @refueling" do
      Refueling.stub(:new) { mock_refueling }
      get :new
      assigns(:refueling).should be(mock_refueling)
    end
  end

  describe "GET edit" do
    it "assigns the requested refueling as @refueling" do
      Refueling.stub(:find).with("37") { mock_refueling }
      get :edit, :id => "37"
      assigns(:refueling).should be(mock_refueling)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created refueling as @refueling" do
        Refueling.stub(:new).with({'these' => 'params'}) { mock_refueling(:save => true) }
        post :create, :refueling => {'these' => 'params'}
        assigns(:refueling).should be(mock_refueling)
      end

      it "redirects to the created refueling" do
        Refueling.stub(:new) { mock_refueling(:save => true) }
        post :create, :refueling => {}
        response.should redirect_to(refueling_url(mock_refueling))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved refueling as @refueling" do
        Refueling.stub(:new).with({'these' => 'params'}) { mock_refueling(:save => false) }
        post :create, :refueling => {'these' => 'params'}
        assigns(:refueling).should be(mock_refueling)
      end

      it "re-renders the 'new' template" do
        Refueling.stub(:new) { mock_refueling(:save => false) }
        post :create, :refueling => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested refueling" do
        Refueling.stub(:find).with("37") { mock_refueling }
        mock_refueling.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :refueling => {'these' => 'params'}
      end

      it "assigns the requested refueling as @refueling" do
        Refueling.stub(:find) { mock_refueling(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:refueling).should be(mock_refueling)
      end

      it "redirects to the refueling" do
        Refueling.stub(:find) { mock_refueling(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(refueling_url(mock_refueling))
      end
    end

    describe "with invalid params" do
      it "assigns the refueling as @refueling" do
        Refueling.stub(:find) { mock_refueling(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:refueling).should be(mock_refueling)
      end

      it "re-renders the 'edit' template" do
        Refueling.stub(:find) { mock_refueling(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested refueling" do
      Refueling.stub(:find).with("37") { mock_refueling }
      mock_refueling.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the refuelings list" do
      Refueling.stub(:find) { mock_refueling }
      delete :destroy, :id => "1"
      response.should redirect_to(refuelings_url)
    end
  end

end
