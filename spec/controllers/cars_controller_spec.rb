require 'spec_helper'
describe CarsController do
  login_user

  before(:each) do
    @current_user = mock_model(User)
    controller.stub(:current_user).and_return(@current_user)

    @car = mock_model(Car)
    @cars = [@car]
    @cars.stub(:build).and_return(@car)

    @current_user.stub(:cars).and_return(@cars)
  end

  describe "GET index" do
    describe "iphone" do
      use_iphone

      def do_get
        get :index
      end

      describe "1 car only" do
        it "redirects to show for car" do
          @current_user.should_receive(:cars).and_return([@car])
          do_get
          response.should redirect_to(@car)
        end

      end

      describe "more than 1 cars available" do
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
      end


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
    # before(:each) do
    #   @slideshow = Slideshow.new
    #   Slideshow.stub(:new).and_return(@slideshow)
    # end
    #
    # def do_get
    #   get :new
    # end
    #
    # it "should initiate a new slideshow object" do
    #   Slideshow.should_receive(:new)
    #   do_get
    # end
    #
    # it "should assign a new slideshow for the view" do
    #   do_get
    #   assigns[:slideshow].should eql(@slideshow)
    # end

#
#   def mock_car(stubs={})
#     @mock_car ||= mock_model(Car, stubs).as_null_object
#   end
#
#   describe "GET index" do
#     it "assigns all cars as @cars" do
#       Car.stub(:all) { [mock_car] }
#       get :index
#       assigns(:cars).should eq([mock_car])
#     end
#   end
#
#   describe "GET show" do
#     it "assigns the requested car as @car" do
#       Car.stub(:find).with("37") { mock_car }
#       get :show, :id => "37"
#       assigns(:car).should be(mock_car)
#     end
#   end
#
#   describe "GET new" do
#     it "assigns a new car as @car" do
#       Car.stub(:new) { mock_car }
#       get :new
#       assigns(:car).should be(mock_car)
#     end
#   end
#
#   describe "GET edit" do
#     it "assigns the requested car as @car" do
#       Car.stub(:find).with("37") { mock_car }
#       get :edit, :id => "37"
#       assigns(:car).should be(mock_car)
#     end
#   end
#
#   describe "POST create" do
#     describe "with valid params" do
#       it "assigns a newly created car as @car" do
#         Car.stub(:new).with({'these' => 'params'}) { mock_car(:save => true) }
#         post :create, :car => {'these' => 'params'}
#         assigns(:car).should be(mock_car)
#       end
#
#       it "redirects to the created car" do
#         Car.stub(:new) { mock_car(:save => true) }
#         post :create, :car => {}
#         response.should redirect_to(car_url(mock_car))
#       end
#     end
#
#     describe "with invalid params" do
#       it "assigns a newly created but unsaved car as @car" do
#         Car.stub(:new).with({'these' => 'params'}) { mock_car(:save => false) }
#         post :create, :car => {'these' => 'params'}
#         assigns(:car).should be(mock_car)
#       end
#
#       it "re-renders the 'new' template" do
#         Car.stub(:new) { mock_car(:save => false) }
#         post :create, :car => {}
#         response.should render_template("new")
#       end
#     end
#   end
#
#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested car" do
#         Car.stub(:find).with("37") { mock_car }
#         mock_car.should_receive(:update_attributes).with({'these' => 'params'})
#         put :update, :id => "37", :car => {'these' => 'params'}
#       end
#
#       it "assigns the requested car as @car" do
#         Car.stub(:find) { mock_car(:update_attributes => true) }
#         put :update, :id => "1"
#         assigns(:car).should be(mock_car)
#       end
#
#       it "redirects to the car" do
#         Car.stub(:find) { mock_car(:update_attributes => true) }
#         put :update, :id => "1"
#         response.should redirect_to(car_url(mock_car))
#       end
#     end
#
#     describe "with invalid params" do
#       it "assigns the car as @car" do
#         Car.stub(:find) { mock_car(:update_attributes => false) }
#         put :update, :id => "1"
#         assigns(:car).should be(mock_car)
#       end
#
#       it "re-renders the 'edit' template" do
#         Car.stub(:find) { mock_car(:update_attributes => false) }
#         put :update, :id => "1"
#         response.should render_template("edit")
#       end
#     end
#   end
#
#   describe "DELETE destroy" do
#     it "destroys the requested car" do
#       Car.stub(:find).with("37") { mock_car }
#       mock_car.should_receive(:destroy)
#       delete :destroy, :id => "37"
#     end
#
#     it "redirects to the cars list" do
#       Car.stub(:find) { mock_car }
#       delete :destroy, :id => "1"
#       response.should redirect_to(cars_url)
#     end
  # end

end
