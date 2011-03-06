require 'spec_helper'
describe RefuelingsController do
  login_user

  before(:each) do
    @current_user = mock_model(User)
    controller.stub(:current_user).and_return(@current_user)

    @car = mock_model(Car)
    @cars = [@car]

    @refueling = mock_model(Refueling)
    @refuelings = [@refueling]
    @refuelings.stub(:build).and_return(@refueling)
    @refuelings.stub(:find).and_return(@refueling)

    @current_user.stub(:cars).and_return(@cars)
    @current_user.stub(:refuelings).and_return(@refuelings)
  end

  describe "GET new" do
    describe "iphone" do
      use_iphone

      def do_get
        get :new
      end

      it "checks if user has entered car data" do
        @current_user.should_receive(:cars).and_return(@cars)
        @cars.should_receive(:empty?)
        do_get
      end

      it "redirects to new_car if no cars exist yet" do
        @current_user.stub(:cars).and_return([])
        do_get
        response.should redirect_to(new_car_path)
      end

      it "assigns a new refueling as @refueling if cars exist" do
        @current_user.should_receive(:refuelings).and_return(@refuelings)
        @refuelings.should_receive(:build).and_return(@refueling)
        do_get
        assigns(:refueling).should be(@refueling)
      end
    end
  end

  describe "POST create" do
    describe "iphone" do
      use_iphone

      def do_post
        post :create, :refueling => {'these' => 'params'}
      end

      describe "with valid params" do
        before(:each) do
          @refueling.stub(:save).and_return(true)
        end

        it "assigns a newly created fueling as @fueling" do
          @current_user.should_receive(:refuelings).and_return(@refuelings)
          @refuelings.should_receive(:build).with({'these' => 'params'}).and_return(@refueling)
          do_post
          assigns(:refueling).should be(@refueling)
        end

        it "saves the refueling" do
          @refueling.should_receive(:save)
          do_post
        end

        it "redirects to refueling" do
          do_post
          response.should redirect_to(refueling_path(@refueling))
        end
      end

      describe "with invalid params" do
        before(:each) do
          @refueling.stub(:save).and_return(false)
        end

        it "re-renders the 'new' template" do
          do_post
          response.should render_template("new")
        end
      end
    end
  end

  describe "GET show" do
    describe "iphone" do
      use_iphone

      def do_get
        get :show, :id => "37"
      end

      it "assigns the requested refueling as @refueling" do
        @current_user.should_receive(:refuelings).and_return(@refuelings)
        @refuelings.should_receive(:find).with("37").and_return(@refueling)
        do_get
        assigns(:refueling).should be(@refueling)
      end

      it "assigns the user's  cars as @cars" do
        @current_user.should_receive(:cars).and_return(@cars)
        do_get
        assigns(:cars).should == @cars
      end
    end
  end

  describe "GET edit" do
    describe "iphone" do
      use_iphone

      def do_get
        get :edit, :id => "37"
      end

      it "assigns the requested refueling as @refueling" do
        @current_user.should_receive(:refuelings).and_return(@refuelings)
        @refuelings.should_receive(:find).with("37").and_return(@refueling)
        do_get
        assigns(:refueling).should be(@refueling)
      end

    end
  end

  describe "DELETE destroy" do
    describe "iphone" do
      use_iphone

      before(:each) do
        @refueling.stub(:car).and_return(@car)
      end

      def do_delete
        delete :destroy, :id => "37"
      end

      it "destroys the requested refueling" do
        @current_user.should_receive(:refuelings).and_return(@refuelings)
        @refuelings.should_receive(:find).with("37").and_return(@refueling)
        @refueling.should_receive(:destroy)
        do_delete
      end

      it "assigns the fueled car as @car" do
        @refueling.should_receive(:car).and_return(@car)
        do_delete
        assigns(:car).should be(@car)
      end

      it "redirects to the refuelings list" do
        do_delete
        response.should redirect_to(@car)
      end
    end
  end

  describe "PUT update" do
    describe "iphone" do
      use_iphone

      def do_put
        put :update, :id => "37", :refueling => {'these' => 'params'}
      end

      describe "with valid params" do
        before(:each) do
          @refueling.stub(:update_attributes).and_return(true)
        end

        it "assigns the requested refueling as @refueling" do
          @current_user.should_receive(:refuelings).and_return(@refuelings)
          @refuelings.should_receive(:find).with("37").and_return(@refueling)
          do_put
          assigns(:refueling).should be(@refueling)
        end

        it "updates the refueling" do
          @refueling.should_receive(:update_attributes).with({'these' => 'params'})
          do_put
        end

        it "redirects to refueling" do
          do_put
          response.should redirect_to(refueling_path(@refueling))
        end
      end

      describe "with invalid params" do
        before(:each) do
          @refueling.stub(:update_attributes).and_return(false)
        end

        it "re-renders the 'new' template" do
          do_put
          response.should render_template("new")
        end
      end
    end
  end

  #
  # describe "GET index" do
  #   it "assigns all refuelings as @refuelings" do
  #     Refueling.stub(:all) { [mock_refueling] }
  #     get :index
  #     assigns(:refuelings).should eq([mock_refueling])
  #   end
  # end
  #
  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested refueling" do
  #       Refueling.stub(:find).with("37") { mock_refueling }
  #       mock_refueling.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :refueling => {'these' => 'params'}
  #     end
  #
  #     it "assigns the requested refueling as @refueling" do
  #       Refueling.stub(:find) { mock_refueling(:update_attributes => true) }
  #       put :update, :id => "1"
  #       assigns(:refueling).should be(mock_refueling)
  #     end
  #
  #     it "redirects to the refueling" do
  #       Refueling.stub(:find) { mock_refueling(:update_attributes => true) }
  #       put :update, :id => "1"
  #       response.should redirect_to(refueling_url(mock_refueling))
  #     end
  #   end
  #
  #   describe "with invalid params" do
  #     it "assigns the refueling as @refueling" do
  #       Refueling.stub(:find) { mock_refueling(:update_attributes => false) }
  #       put :update, :id => "1"
  #       assigns(:refueling).should be(mock_refueling)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       Refueling.stub(:find) { mock_refueling(:update_attributes => false) }
  #       put :update, :id => "1"
  #       response.should render_template("edit")
  #     end
  #   end
  # end
  #

end
