require 'spec_helper'
describe CarsController do
  login_user

  before(:each) do
    @current_user = mock_model(User, :locale => 'en')
    controller.stub(:current_user).and_return(@current_user)

    @car = mock_model(Car)
    @cars = [@car]
    @cars.stub(:build).and_return(@car)
    @cars.stub(:find).and_return(@car)

    @current_user.stub(:cars).and_return(@cars)
  end

  describe "GET index" do
    describe "iphone" do
      use_iphone

      def do_get
        get :index
      end

      # describe "1 car only" do
      #   it "redirects to show for car" do
      #     @current_user.should_receive(:cars).and_return([@car])
      #     do_get
      #     response.should redirect_to(@car)
      #   end
      #
      # end

      # describe "more than 1 cars available" do
        before(:each) do
          @cars = Array.new(2, mock_model(Car))
          @current_user.stub(:cars).and_return(@cars)
        end

        it "assigns all cars as @cars" do
          @current_user.should_receive(:cars).and_return(@cars)
          do_get
          assigns(:cars).should eq(@cars)
        end

        it "render the 'index' template" do
          do_get
          response.should render_template("index")
        end
      # end


    end
  end

  describe "GET new" do
    describe "iphone" do
      use_iphone

      def do_get
        get :new
      end

      it "assigns a new car as @car" do
        @current_user.should_receive(:cars).and_return(@cars)
        @cars.should_receive(:build).and_return(@car)
        do_get
        assigns(:car).should be(@car)
      end

      it "assigns all fuels as @fuels" do
        @fuels = Fuel.all
        Fuel.should_receive(:all).and_return(@fuels)
        do_get
        assigns(:fuels).should eql(@fuels)
      end
    end
  end

  describe "POST create" do
    describe "iphone" do
      use_iphone

      def do_post
        post :create, :car => {'these' => 'params'}
      end

      describe "with valid params" do
        before(:each) do
          @car.stub(:save).and_return(true)
        end


        it "assigns a newly created car as @car" do
          @current_user.should_receive(:cars).and_return(@cars)
          @cars.should_receive(:build).with({'these' => 'params'}).and_return(@car)
          do_post
          assigns(:car).should be(@car)
        end

        it "saves the car" do
          @car.should_receive(:save)
          do_post
        end

        it "redirects to new refueling" do
          do_post
          response.should redirect_to(new_refueling_path)
        end
      end

      describe "with invalid params" do
        before(:each) do
          @car.stub(:save).and_return(false)
        end

        it "assigns a newly created but unsaved car as @car" do
          do_post
          assigns(:car).should be(@car)
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

      it "assigns the requested car as @car" do
        @current_user.should_receive(:cars).and_return(@cars)
        @cars.should_receive(:find).with("37").and_return(@car)
        do_get
        assigns(:car).should be(@car)
      end

    end
  end

  describe "GET edit" do
    describe "iphone" do
      use_iphone

      def do_get
        get :edit, :id => "37"
      end

      it "assigns the requested car as @car" do
        @current_user.should_receive(:cars).and_return(@cars)
        @cars.should_receive(:find).with("37").and_return(@car)
        do_get
        assigns(:car).should be(@car)
      end

      it "assigns all fuels as @fuels" do
        @fuels = Fuel.all
        Fuel.should_receive(:all).and_return(@fuels)
        do_get
        assigns(:fuels).should eql(@fuels)
      end

    end
  end

  describe "PUT update" do
    describe "iphone" do
      use_iphone

      def do_put
        put :update, :id => "37", :car => {'these' => 'params'}
      end

      describe "with valid params" do
        before(:each) do
          @car.stub(:update_attributes).and_return(true)
        end

        it "assigns the requested car as @car" do
          @current_user.should_receive(:cars).and_return(@cars)
          @cars.should_receive(:find).with("37").and_return(@car)
          do_put
          assigns(:car).should be(@car)
        end

        it "updates the car" do
          @car.should_receive(:update_attributes).with({'these' => 'params'})
          do_put
        end

        it "redirects to car" do
          do_put
          response.should redirect_to(@car)
        end
      end

      describe "with invalid params" do
        before(:each) do
          @car.stub(:update_attributes).and_return(false)
        end

        it "re-renders the 'edit' template" do
          do_put
          response.should render_template("edit")
        end
      end
    end
  end

  describe "DELETE destroy" do
    describe "iphone" do
      use_iphone

      def do_delete
        delete :destroy, :id => "37"
      end

      it "destroys the requested car" do
        @current_user.should_receive(:cars).and_return(@cars)
        @cars.should_receive(:find).with("37").and_return(@car)
        @car.should_receive(:destroy)
        do_delete
      end

      it "redirects to the cars list" do
        do_delete
        response.should redirect_to(cars_path)
      end
    end
  end
end
